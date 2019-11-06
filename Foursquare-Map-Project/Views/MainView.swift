//
//  MainView.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/4/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit
import MapKit



class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 2.0
        return map
    }()
    
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
//        searchBar.layer.cornerRadius = 0.1
        searchBar.placeholder = "search for venue"
        return searchBar
    }()
    
    lazy var userLocation: UISearchBar = {
        let locationBar = UISearchBar()
//        locationBar.layer.cornerRadius = 0.1
        locationBar.placeholder = "New York, NY"
        return locationBar
    }()
    
    lazy var cancelButton: UIButton = {
        let cancelButtn = UIButton()
//        cancelButtn.layer.cornerRadius = 0.25
        let image = UIImage(systemName: "rectangle")
        cancelButtn.setImage(image, for: .normal)
//        cancelButtn.addTarget(self, action: #selector(optionButtonPressed(sender:)), for: .touchUpInside)
        
//        cancelButtn.setBackgroundImage(.actions, for: .normal)
        cancelButtn.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        return cancelButtn
    }()
    
    //    lazy var userLocation: UISearchBar = {
    //            let locationBar = UISearchBar()
    //            locationBar.layer.cornerRadius = 10.0
    //            locationBar.placeholder = "New York, NY"
    //            return locationBar
    //        }()
    
    func setConstraints() {
        searchConstraints()
        userLocationConstraints()
        cancelButtnConstraints()
        mapConstraints()
        
    }
    
    private func cancelButtnConstraints() {
        addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 310),
            cancelButton.widthAnchor.constraint(equalToConstant: 75),
            cancelButton.heightAnchor.constraint(equalToConstant: 35)])
    }
    
    private func searchConstraints() {
        addSubview(search)
        search.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            search.leadingAnchor.constraint(equalTo: leadingAnchor),
            search.widthAnchor.constraint(equalToConstant: 325),
            search.heightAnchor.constraint(equalToConstant: 35)])
        
    }
    
    private func userLocationConstraints() {
        addSubview(userLocation)
        userLocation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLocation.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 0),
            userLocation.leadingAnchor.constraint(equalTo: leadingAnchor),
            userLocation.trailingAnchor.constraint(equalTo: trailingAnchor),
            userLocation.heightAnchor.constraint(equalToConstant: 35)])
    }
    private func mapConstraints() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: userLocation.bottomAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1),
            mapView.heightAnchor.constraint(equalToConstant: 550)])
    }
}
