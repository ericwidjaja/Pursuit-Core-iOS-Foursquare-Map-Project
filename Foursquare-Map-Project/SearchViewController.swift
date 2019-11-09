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
    let searchInitialCoordinates = CLLocationCoordinate2D(latitude: 40.742442, longitude: -73.941235)
    let searchRadius: CLLocationDistance = 5000
    
    var venues = [VenueStruct]()
    
    private var currentRegion = MKCoordinateRegion() {
        didSet {
            getVenues(keyword: "dance")
        }
    }
    
    //    private func userSearch() -> String {
    //       //More code here
    //
    //    }
    
    private func getVenues(keyword: String) {
        SearchAPIClient.getVenue(latitude: currentRegion.center.latitude.description, longitude: currentRegion.center.longitude.description, category: keyword) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let venues):
                    self.venues = venues
                    self.makeAnnotations()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func makeAnnotations() {
        let annotations = mainView.mapView.annotations
        mainView.mapView.removeAnnotations(annotations)
        
        for venue in venues {
            let newAnnotation = MKPointAnnotation()
            newAnnotation.coordinate = CLLocationCoordinate2D(latitude: venue.location.lat ?? 0.0, longitude: venue.location.lng ?? 0.0)
            newAnnotation.title = venue.name
            mainView.mapView.addAnnotation(newAnnotation)
        }
    }

    private func setMainView() {
        view.addSubview(mainView)
        locationManager.delegate = self
        mainView.mapView.userTrackingMode = .follow
        self.currentRegion = MKCoordinateRegion(center: searchInitialCoordinates, latitudinalMeters: searchRadius, longitudinalMeters: searchRadius)
        mainView.mapView.setRegion(currentRegion, animated: true)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainView()
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
