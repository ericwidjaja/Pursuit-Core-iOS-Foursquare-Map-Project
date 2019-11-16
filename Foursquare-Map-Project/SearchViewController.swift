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
    
    //MARK: - Objects
    let mainView = MainView()
    let locationManager = CLLocationManager()
    var searchCoordinates = CLLocationCoordinate2D(latitude: 40.742442, longitude: -73.941235)
    let searchRadius: CLLocationDistance = 5000
    
    var venues = [VenueStruct]()
    var annotations = [MKAnnotation]()
    var currentRegion = MKCoordinateRegion() {
        didSet {
            getVenues(keyword: userDefaultsSearchTerm())
        }
    }
 
    @objc func listButtonPressed() {
        let tableVC = VenuesListTableVC()
        self.modalPresentationStyle = .fullScreen
        tableVC.venuesForTable = venues
        present(tableVC, animated: true, completion: nil)
    }
    
    private func userDefaultsSearchTerm() -> String {
        if let searchTermFromUserDefaults = UserDefaults.standard.object(forKey: UserDefault.searchTerm) as? String {
            return searchTermFromUserDefaults
        } else {
            return "dance"
        }
    }
    
    private func getVenues(keyword: String) {
    SearchAPIClient.getVenue(latitude: currentRegion.center.latitude.description, longitude: currentRegion.center.longitude.description, category: keyword) { (result) in
        DispatchQueue.main.async {
                switch result {
                case .success(let venues):
                    self.venues = venues
                    self.makeAnnotations()
                    self.mainView.venuesCollectionView.reloadData()
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
    
    private func mapZoomIn(locationCoordinate: CLLocation) {
        let coordinateRegion = MKCoordinateRegion.init(center: locationCoordinate.coordinate, latitudinalMeters: self.searchRadius * 1.5, longitudinalMeters: self.searchRadius * 1.5)
        self.mainView.mapView.setRegion(coordinateRegion, animated: true)
    }

    private func setMainView() {
        view.addSubview(mainView)
        locationManager.delegate = self
        mainView.mapView.userTrackingMode = .follow
        self.currentRegion = MKCoordinateRegion(center: searchCoordinates, latitudinalMeters: searchRadius, longitudinalMeters: searchRadius)
        mainView.mapView.setRegion(currentRegion, animated: true)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainView()
        checkLocationPermission()
        locationManager.delegate = self
        mainView.eventsListButton.addTarget(self, action: #selector(listButtonPressed), for: .touchUpInside)
        mainView.mapView.delegate = self
        mainView.mapView.userTrackingMode = .follow
        mainView.venuesCollectionView.delegate = self
        mainView.venuesCollectionView.dataSource = self
        mainView.venueSearch.delegate = self
        mainView.userLocation.delegate = self
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
//MARK: CollectionViewDelegate
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewcell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        let venueToSet = venues[indexPath.row]
        collectionViewcell.activityIndicator.startAnimating()
        collectionViewcell.nameLabel.text = venueToSet.name
        collectionViewcell.addressLabel.text = venueToSet.location.formattedAddress[0] + " \n" +  venueToSet.location.formattedAddress[1]
        ImageAPIClient.getImages(venueID: venueToSet.id) { (appError, imageLink) in
            if let appError = appError {
                print("imageClient - \(appError)")
            } else if let imageLink = imageLink {
                self.venues[indexPath.row].imageLink = imageLink
                if let imageIsInCache = ImageHelper.fetchImageFromCache(urlString: imageLink) {
                    DispatchQueue.main.async {
                        collectionViewcell.imageView.image = imageIsInCache
                    }
                } else {
                    ImageHelper.fetchImageFromNetwork(urlString: imageLink, completion: { (appError, image) in
                        if let appError = appError {
                            print("imageHelper error - \(appError)")
                        } else if let image = image {
                            collectionViewcell.imageView.image = image
                            print("mainVC - got image from network")
                        }
                    })
                }
                DispatchQueue.main.async {
                    collectionViewcell.activityIndicator.stopAnimating()
                }
            }
        }
        return collectionViewcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = DetailVC()
        destinationVC.venue = venues[indexPath.row]
        present(destinationVC, animated: true, completion: nil)
    }
}
 
//MARK: SearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        switch searchBar {
        case mainView.venueSearch:
            searchBar.resignFirstResponder()
            guard let searchText = searchBar.text else { return }
            getVenues(keyword: searchText)
            UserDefaults.standard.set(searchText, forKey: UserDefault.searchTerm)
        default:
            print("more code here")
            //update search bar geo
        }
        
    }
}

extension SearchViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Update location: \(locations)")
        currentRegion = MKCoordinateRegion()
        if let currentLocation = locations.last {
        currentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                
            } else {
                currentRegion = MKCoordinateRegion(center: searchCoordinates, latitudinalMeters: 250, longitudinalMeters: 250)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            mainView.mapView.showsUserLocation = true
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            mapZoomIn(locationCoordinate: )
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
}

extension SearchViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Callouts") as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Callouts")
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let calloutClicked = view.annotation else {
            fatalError("callout is nil")
        }
        if let venueName = calloutClicked.title, let venue = (venues.filter{ $0.name == venueName}).first {
            let destination = DetailVC()
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
}
