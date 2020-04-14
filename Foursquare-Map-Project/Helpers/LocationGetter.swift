//
//  LocationGetter.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/19/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation
import CoreLocation

struct GetLocation {
    static func getData(name: String, type: String) -> Data {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            fatalError("\(name) \(type) file not found")
        }
        let internalURL = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: internalURL)
            return data
        } catch {
            fatalError("An error has occured: \(error)")
        }
    }
}
