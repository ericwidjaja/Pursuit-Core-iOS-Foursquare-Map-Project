//
//  VenueImages.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/9/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation

struct VenueImages: Codable {
    let response: ResponseWrap
}

struct ResponseWrap: Codable {
    let photos: PhotoWrap
}

struct PhotoWrap: Codable {
    let items: [ItemWrapper]
}

struct ItemWrapper: Codable {
    let prefix: String
    let suffix: String
}
