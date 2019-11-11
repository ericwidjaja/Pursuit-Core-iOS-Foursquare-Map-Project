//
//  NetworkHelper.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/6/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkHelper {
    
    // MARK: - Static Properties
    
    static let manager = NetworkHelper()
    
    // MARK: - Internal Properties
    
    func performDataTask(withUrl url: URL,
                         andHTTPBody body: Data? = nil,
                         andMethod httpMethod: HTTPMethod,
                         completionHandler: @escaping ((Result<Data, AppError>) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299) ~= response.statusCode else {
                    completionHandler(.failure(.badStatusCode))
                    return
                }
                if let error = error {
                    let error = error as NSError
                    if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {completionHandler(.failure(.noInternetConnection))
                        return
                    } else {
                        completionHandler(.failure(.other(rawError: error)))
                        return
                    }
                }
                completionHandler(.success(data))
            }
        }.resume()
    }
    
    // MARK: - Private Properties and Initializers
    
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private init() {}
    
    static let shared = NetworkHelper()
    func performDataTask(endpointURLString: String,
                         httpMethod: String,
                         httpBody: Data?,
                         handler: @escaping (AppError?, Data?) -> Void) {
        guard let url = URL(string: endpointURLString) else {
            handler(AppError.badURL, nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.httpBody = httpBody
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                handler(AppError.noDataReceived, nil)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                    handler(AppError.badStatusCode, nil)
                    return
            }
            if let data = data {
                handler(nil, data)
            }
        }
        task.resume()
    }
}
