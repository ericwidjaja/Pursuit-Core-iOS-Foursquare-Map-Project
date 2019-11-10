//
//  ImageAPIClient.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/9/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation

//class ImageAPIClient {
//
//    static func getImages(venueID: String, completionHandler: @escaping (Result<String, AppError>) -> Void) {
//        
//        let urlStr = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(Secrets.myID)&client_secret=\(Secrets.secretKey)&v=20191108"
//        guard let url = URL(string: urlStr) else {
//            completionHandler(.failure(.badURL))
//            return
//        }
//        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
//            switch result {
//            case .failure(let error) :
//                completionHandler(.failure(error))
//            case .success(let data):
//                do {
//                    let imageData = try JSONDecoder().decode(VenueImages.self, from: data)
//                    completionHandler(.success(imageData.response.photos.items))
////                    if let safeImage = imageData.response.photos.items.first{
////                        let imageLink = safeImage.prefix + "100x100" + safeImage.suffix
//
//                } catch {
//                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
//                }
//            }
//        }
//    }
//}
