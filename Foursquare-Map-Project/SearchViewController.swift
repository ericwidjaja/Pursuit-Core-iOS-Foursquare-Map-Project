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
    let searchInitialCoordinates = CLLocation(latitude: 40.742442, longitude: -73.941235)
    let searchRadius: CLLocationDistance = 1000

    var venues = [VenueStruct]()

    private func getVenues(keyword: String) {
        //put searchAPIClient codes here
    }

    private func setMainView() {
        view.addSubview(mainView)
        locationManager.delegate = self
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainView()
        locationManager.delegate = self
        mainView.mapView.userTrackingMode = .follow
        checkLocationPermission()
    }
    private func checkLocationPermission() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            mainView.mapView.showsUserLocation = true
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension SearchViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("InitialSearchLocation")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
}
