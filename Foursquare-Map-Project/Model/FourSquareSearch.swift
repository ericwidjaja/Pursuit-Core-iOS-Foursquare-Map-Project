//
//  FourSquareSearch.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/4/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation

//https://api.foursquare.com/v2/venues/search?client_id=PO30AILO2IJRCZEI4MI5RPYZ1PB5T5CSRV4DCTEJVH0ECEPL&client_secret=NASDPNCTT40XLSIQVYZA0Q0KPKQ2UN3J5ZP1NGSQJQZQVVOV&ll=40.7429635,-73.9441102&query=coffee&v=20191104


struct FourSquareModel: Codable {
    let response: ResponseWrapper
    
}

struct ResponseWrapper: Codable {
    let venues: [VenueStruct]
}
struct VenueStruct: Codable {
    var imageLink: String?
    let id: String
    let name: String
    let location: LocationWrapper
    let categories: [CategoryWrapper]
}
struct LocationWrapper: Codable {
    let address: String?
    let lat: Double?
    let lng: Double?
    let labeledLatLngs: [LatLongWrapper]
    let formattedAddress: [String]
    var modifiedAddress: String {
        let address = """
        
        \(formattedAddress[0]),
        \(formattedAddress[1]),
        \(formattedAddress[2])
        """
        
        return address
    }
}
struct LatLongWrapper: Codable {
    let label: String
    let lat: Double
    let lng: Double
}

struct CategoryWrapper: Codable {
    let id: String
    let name: String
    let pluralName: String
    let shortName: String
    let icon: IconWrapper
}

struct IconWrapper: Codable {
    let prefix: String
    let suffix: String
}
