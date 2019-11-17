//
//  CollectionPersistence.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/17/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import Foundation

class CollectionPersistence {
    private init() {}
    static let helper = CollectionPersistence()
    private let persistanceHelper = PersistenceHelper<FaveCollections>.init(fileName: "FaveCollections.plist")
    
    func save(newElement: FaveCollections) throws {
        try persistanceHelper.save(newElement: newElement)
    }
    func replace(newArr: [FaveCollections]) throws {
        try persistanceHelper.replace(arrOfElements: newArr)
    }
    
    func getVenues() throws -> [FaveCollections] {
        try persistanceHelper.getObjects()
    }
}
