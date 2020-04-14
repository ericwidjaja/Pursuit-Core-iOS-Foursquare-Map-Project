//
//  MainView.swift
//  Foursquare-Map-Project
//  Created by Eric Widjaja on 11/4/19.
//  Copyright © 2019 Eric W. All rights reserved.

import UIKit
import MapKit
import CoreLocation

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstraints()
        self.venuesCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 3.0
        map.showsUserLocation = true
        map.mapType = .standard
        return map
    }()
    
    lazy var venueSearch: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "search for venue"
        return searchBar
    }()
    
    lazy var userLocationSearch: UISearchBar = {
        let locationBar = UISearchBar()
        locationBar.placeholder = "Long Island City, NY"
        return locationBar
    }()
    
    lazy var eventsListButton: UIButton = {
        let listButton = UIButton()
        let listButtonImageSetting = UIImage.SymbolConfiguration(pointSize: 40, weight: UIImage.SymbolWeight.semibold)
        listButton.setImage(UIImage(systemName: "line.horizontal.3", withConfiguration: listButtonImageSetting), for: .normal)
        listButton.imageView?.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return listButton
    }()
    
    lazy var venuesCollectionView: UICollectionView = {
        
        let cellLayout = UICollectionViewFlowLayout()
        cellLayout.scrollDirection = .horizontal
        cellLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 1, bottom: 0, right: 1)
        cellLayout.itemSize = CGSize.init(width: 165, height: 200)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        collectionView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        collectionView.layer.cornerRadius = 5.0
        return collectionView
    }()
    
    func setConstraints() {
        searchConstraints()
        userLocationConstraints()
        listButtonConstraints()
        mapConstraints()
        collectionViewConstraints()
        
    }
    
    //MARK: - Constraints
    private func listButtonConstraints() {
        addSubview(eventsListButton)
        eventsListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventsListButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            eventsListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 365),
            eventsListButton.widthAnchor
                .constraint(equalToConstant: 40),
            eventsListButton.heightAnchor.constraint(equalToConstant: 45)])
    }
    
    private func searchConstraints() {
        addSubview(venueSearch)
        venueSearch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venueSearch.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            venueSearch.leadingAnchor.constraint(equalTo: leadingAnchor),
            venueSearch.widthAnchor.constraint(equalToConstant: 360),
            venueSearch.heightAnchor.constraint(equalToConstant: 45)])
        
    }
    
    private func userLocationConstraints() {
        addSubview(userLocationSearch)
        userLocationSearch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLocationSearch.topAnchor.constraint(equalTo: venueSearch.bottomAnchor, constant: 0),
            userLocationSearch.leadingAnchor.constraint(equalTo: leadingAnchor),
            userLocationSearch.trailingAnchor.constraint(equalTo: trailingAnchor),
            userLocationSearch.heightAnchor.constraint(equalToConstant: 45)])
    }
    private func mapConstraints() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: userLocationSearch.bottomAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1),
            mapView.heightAnchor.constraint(equalToConstant: 470)])
    }
    private func collectionViewConstraints() {
        addSubview(venuesCollectionView)
        venuesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([venuesCollectionView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 1),                            venuesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1), venuesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1), venuesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
