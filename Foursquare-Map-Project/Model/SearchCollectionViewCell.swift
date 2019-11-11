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
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    lazy var imageView: UIImageView = {
        let venueView = UIImageView()
        venueView.image = UIImage.init(named: "burgers")
        return venueView
        
    }()
    
    lazy var nameLabel: UILabel = {
        let venueName = UILabel()
        venueName.numberOfLines = 0
        venueName.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        venueName.textAlignment = .center
        venueName.adjustsFontSizeToFitWidth = true
        venueName.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        venueName.font = UIFont(name: "Rockwell-Bold", size: 14)
        venueName.textColor = .white
        return venueName
        
    }()
    
    lazy var addressLabel: UILabel = {
        let venueAddress = UILabel()
        venueAddress.numberOfLines = 0
        venueAddress.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        venueAddress.textAlignment = .center
        venueAddress.textColor = .white
        venueAddress.font = UIFont(name: "Rockwell", size: 13)
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
        venueImageConstraints()
        venueNameConstraints()
        venueAddressConstraints()
        venueActivityIndicator()
    }
    //MARK: - CollView Cell Constraints
    private func venueImageConstraints() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)])}
    
    private func venueNameConstraints(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)])}
        
    private func venueAddressConstraints() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
        addressLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])}
    
    private func venueActivityIndicator(){
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0),
        activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: 0)])
    }
}
