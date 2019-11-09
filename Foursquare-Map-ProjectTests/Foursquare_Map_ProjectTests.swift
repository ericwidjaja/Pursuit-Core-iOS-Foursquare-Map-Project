//
//  Foursquare_Map_ProjectTests.swift
//  Foursquare-Map-ProjectTests
//
//  Created by Eric Widjaja on 11/4/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import XCTest

//@testable import Foursquare_Map_Project

class Foursquare_Map_ProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//    func testFourSquareSearchModel() {
//        guard let path = Bundle.main.path(forResource: "FourSquareLocationJSON", ofType: "json") else { return }
//        
//        let url = URL(fileURLWithPath: path)
//        do {
//            let data = try Data(contentsOf: url)
//            let testVenue = 
//            
//            let testVenue = try DarkSkyWeather.getForecastFromData(data: data) ?? []
//            print(testWeather.count)
//            XCTAssert(testWeather.count > 0, "We have \(testWeather.count) listings")
//        } catch {
//            print(error)
//            XCTFail()
//        }
    }
}
