//
//  SearchViewController.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/5/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchViewController: UIViewController {
    
    let mainView = MainView()
    let locationManager = CLLocationManager()
    var searchCoordinatesOrigin = CLLocationCoordinate2DMake(40.742442, -73.941235)
    
    var venues = [VenueStruct]()
    var annotations = [MKAnnotation]()
    
//    var myCurrentRegion = MKCoordinateRegion() {
//        didSet {
//            getVenues(keyword: userSearch())
//        }
//    }
    
    
    private func getVenues(keyword: String) {
        //put searchAPIClient codes here
    }
    
//    private func userSearch() -> String {
//        //define userSearch here
//        return
//    }
    
    
    private func setMainView() {
        view.addSubview(mainView)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainView()

        // Do any additional setup after loading the view.
    }
}
