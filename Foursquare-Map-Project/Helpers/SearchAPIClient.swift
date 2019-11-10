//
//  SearchAPIClient.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/6/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation
class SearchAPIClient {
    
    private init() {}
    
    static func getVenue(latitude: String, longitude: String, category: String, completionHandler: @escaping (Result<[VenueStruct],AppError>) -> Void) {
        
        let urlString = "https://api.foursquare.com/v2/venues/search?client_id=\(Secrets.myID)&client_secret=\(Secrets.secretKey)&v=20180323&ll=\(latitude),\(longitude)&query=\(category)"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let venue = try JSONDecoder().decode(FourSquareModel.self, from: data)
                    completionHandler(.success(venue.response.venues))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
 
