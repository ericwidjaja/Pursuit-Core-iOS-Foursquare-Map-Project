//
//  FaveCollections.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/16/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation

class FaveCollections:
    
    Codable {
    var title: String
    var venues: [VenueStruct]
    
    init(title: String,tip: String?, venues: [VenueStruct]) {
        self.title = title
        self.venues = venues
    }
}
