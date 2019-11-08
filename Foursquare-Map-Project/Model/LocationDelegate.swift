//
//  LocationDelegate.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/7/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation
import CoreLocation

protocol UserLocationDelegate {
    var userLocation: CLLocation { get set }
}
