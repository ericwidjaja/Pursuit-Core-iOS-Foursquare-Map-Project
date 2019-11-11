//
//  ImageAPIClient.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/9/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation

class ImageAPIClient {
    static func getImages(venueID: String, completionHandler: @escaping ((AppError?, String?) -> Void)) {
        let URL = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(Secrets.myID)&client_secret=\(Secrets.secretKey)&v=20191110"
        NetworkHelper.shared.performDataTask(endpointURLString: URL, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let error = appError {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let imageLinkData = try JSONDecoder().decode(VenueImages.self, from: data)
                    if let safeImage = imageLinkData.response.photos.items.first {
                        let imageLink = safeImage.prefix + "300x500" + safeImage.suffix
                        completionHandler(nil, imageLink)
                    }
                } catch {
                    completionHandler(AppError.invalidJSONResponse, nil)
                }
            }
        }
    }
}
