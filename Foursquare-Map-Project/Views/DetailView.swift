//
//  DetailView.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/11/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setDetailConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDetailConstraints()
    }

    var venue: VenueStruct?
    
    //MARK: - Objects
    var navigationBar: UINavigationBar = {
        let bar = UINavigationBar()
        bar.barTintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        return bar
    }()
    var navItem: UINavigationItem = {
        let item = UINavigationItem(title: "DETAILS VIEW")
        return item
    }()
    
//    lazy var addButton: UIBarButtonItem = {
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
//        add.tintColor = .white
//        return add
//    }()
    
    lazy var detailVenueName: UILabel = {
        let venueNameLabel = UILabel()
        venueNameLabel.font = UIFont.init(name: "Rockwell-Bold", size: 22)
        venueNameLabel.textAlignment = .center
        venueNameLabel.numberOfLines = 0
        venueNameLabel.adjustsFontSizeToFitWidth = true
        venueNameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        venueNameLabel.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return venueNameLabel
    }()
    lazy var detailVenueAddress: UITextView = {
        let venueAddressTextView = UITextView()
        venueAddressTextView.dataDetectorTypes = [.address, .phoneNumber]
        venueAddressTextView.textAlignment = .center
        venueAddressTextView.font = UIFont.init(name: "Rockwell", size: 18)
        venueAddressTextView.isEditable = false
        venueAddressTextView.adjustsFontForContentSizeCategory = true
        venueAddressTextView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        venueAddressTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return venueAddressTextView
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    lazy var detailVenueImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    //MARK: Constraints
    func setDetailConstraints() {
        setNavBarConstraints()
        setNavigationItems()
        setNameConstraints()
        setAddressConstraints()
        setImageConstraints()
        
    }
    private func setNavBarConstraints() {
        addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)])
    }
    private func setNavigationItems() {
        navigationBar.items = [navItem]
    }
    
    private func setNameConstraints() {
        addSubview(detailVenueName)
        detailVenueName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailVenueName.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 5),
            detailVenueName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            detailVenueName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            detailVenueName.heightAnchor.constraint(equalToConstant: 100)])
    }
    private func setAddressConstraints() {
        addSubview(detailVenueAddress)
        detailVenueAddress.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailVenueAddress.topAnchor.constraint(equalTo: detailVenueName.bottomAnchor),
            detailVenueAddress.leadingAnchor.constraint(equalTo: detailVenueName.leadingAnchor),
            detailVenueAddress.trailingAnchor.constraint(equalTo: detailVenueName.trailingAnchor),
            detailVenueAddress.heightAnchor.constraint(equalToConstant: 100)])
    }
    private func setImageConstraints() {
        addSubview(detailVenueImage)
        detailVenueImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailVenueImage.topAnchor.constraint(equalTo: detailVenueAddress.bottomAnchor, constant: 5),
            detailVenueImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            detailVenueImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            detailVenueImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
    
    func loadVenueInfo() {
        guard let venue = venue else {return}
        detailVenueName.text = venue.name
        detailVenueAddress.text = venue.location.address
    }
    
    

    


}
