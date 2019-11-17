//
//  FavoritesCellCollectionViewCell.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/16/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class FavoritesCellCollectionViewCell: UICollectionViewCell {
    
    var collectionsImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        image.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return image
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var addButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let buttonImageSetting = UIImage.SymbolConfiguration(pointSize: 40, weight: UIImage.SymbolWeight.semibold)
        button.setImage(UIImage(systemName: "plus.square", withConfiguration: buttonImageSetting), for: .normal)
        button.imageView?.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return button
    }()
    
    func setImageConstraints() {
        contentView.addSubview(collectionsImage)
        collectionsImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionsImage.widthAnchor.constraint(equalToConstant: collectionsImage.frame.width),
            collectionsImage.heightAnchor.constraint(equalToConstant: collectionsImage.frame.height)])
    }
    func setNameConstraints() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: collectionsImage.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: collectionsImage.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: collectionsImage.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    func setAddButtonConstraints() {
        collectionsImage.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.centerYAnchor.constraint(equalTo: collectionsImage.centerYAnchor),
            addButton.centerXAnchor.constraint(equalTo: collectionsImage.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: addButton.frame.height),
            addButton.widthAnchor.constraint(equalToConstant: addButton.frame.width)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageConstraints()
        setNameConstraints()
        setAddButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

