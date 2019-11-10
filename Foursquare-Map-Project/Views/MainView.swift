//
//  MainView.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/4/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

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
        map.layer.cornerRadius = 1.0
        map.showsUserLocation = true
        map.mapType = .standard
        return map
    }()
    
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "search for venue"
        return searchBar
    }()
    
    lazy var userLocation: UISearchBar = {
        let locationBar = UISearchBar()
        locationBar.placeholder = "New York, NY"
        return locationBar
    }()
    
    lazy var eventsListButton: UIButton = {
        let listButton = UIButton()
        let image = UIImage(systemName: "line.horizontal.3")
        listButton.imageView?.tintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        listButton.setImage(image, for: .normal)
//        listButton.addTarget(self, action: #selector(listButtonPressed(sender:)), for: .touchUpInside)
        return listButton
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let cellLayout = UICollectionViewFlowLayout()
            cellLayout.scrollDirection = .horizontal
            cellLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 2, bottom: 0, right: 2)
    
            cellLayout.itemSize = CGSize.init(width: 150, height: 160)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: cellLayout)
            collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
            collectionView.backgroundColor = #colorLiteral(red: 0.8909798861, green: 0.8911294937, blue: 0.8909601569, alpha: 1)
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
            eventsListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 375),
            eventsListButton.widthAnchor
                .constraint(equalToConstant: 35),
            eventsListButton.heightAnchor.constraint(equalToConstant: 45)])
    }
    
    private func searchConstraints() {
        addSubview(search)
        search.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            search.leadingAnchor.constraint(equalTo: leadingAnchor),
            search.widthAnchor.constraint(equalToConstant: 360),
            search.heightAnchor.constraint(equalToConstant: 45)])
        
    }
    
    private func userLocationConstraints() {
        addSubview(userLocation)
        userLocation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userLocation.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 0),
            userLocation.leadingAnchor.constraint(equalTo: leadingAnchor),
            userLocation.trailingAnchor.constraint(equalTo: trailingAnchor),
            userLocation.heightAnchor.constraint(equalToConstant: 45)])
    }
    private func mapConstraints() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: userLocation.bottomAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1),
            mapView.heightAnchor.constraint(equalToConstant: 565)])
    }
    private func collectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 1),                            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1), collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1), collectionView.heightAnchor.constraint(equalToConstant: 161)
        ])
    }
}
