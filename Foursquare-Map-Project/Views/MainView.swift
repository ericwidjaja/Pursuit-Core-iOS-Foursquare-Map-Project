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
    
    public lazy var search: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.layer.cornerRadius = 5.0
            searchBar.placeholder = "Search"
            return searchBar
        }()
    
    public lazy var userLocation: UISearchBar = {
            let locationBar = UISearchBar()
            locationBar.layer.cornerRadius = 5.0
            locationBar.placeholder = "New York, NY"
            return locationBar
        }()
    
    func setConstraints() {
        searchConstraints()
        userLocationConstraints()
        
    }
    
    private func searchConstraints() {
        addSubview(search)
        search.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        search.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), search.leadingAnchor.constraint(equalTo: leadingAnchor),
        search.trailingAnchor.constraint(equalTo: trailingAnchor),
        search.heightAnchor.constraint(equalToConstant: 35)])
        
    }
    
    private func userLocationConstraints() {
        addSubview(userLocation)
        userLocation.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([ userLocation.topAnchor.constraint(equalTo: search.bottomAnchor), userLocation.leadingAnchor.constraint(equalTo: leadingAnchor),
        userLocation.trailingAnchor.constraint(equalTo: trailingAnchor),
        userLocation.heightAnchor.constraint(equalToConstant: 35)])
    }
        
}
