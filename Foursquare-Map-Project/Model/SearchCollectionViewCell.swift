//
//  SearchCollectionViewCell.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/9/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .medium
        ai.hidesWhenStopped = true
        return ai
    }()
    
    lazy var imageView: UIImageView = {
        let venueView = UIImageView()
        venueView.image = UIImage.init(named: "coffee")
        return venueView
        
    }()
    
    lazy var nameLabel: UILabel = {
        let venueName = UILabel()
        venueName.numberOfLines = 0
        venueName.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        venueName.textAlignment = .center
        venueName.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        venueName.font = UIFont(name: "Copperplate-Bold", size: 16)
        venueName.textColor = .white
        return venueName
        
    }()
    
    lazy var addressLabel: UILabel = {
        let venueAddress = UILabel()
        venueAddress.numberOfLines = 0
        venueAddress.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        venueAddress.textAlignment = .center
        //restuarantAddress.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        venueAddress.textColor = .white
        venueAddress.font = UIFont(name: "Copperplate-Bold", size: 16)
        return venueAddress
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setConstraints()
    }
    private func setConstraints() {
        
        addSubview(imageView)
        addSubview(addressLabel)
        addSubview(nameLabel)
        addSubview(activityIndicator)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints =  false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        
        
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0).isActive = true
        
    }
}


