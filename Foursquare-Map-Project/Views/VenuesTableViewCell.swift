//
//  VenuesTableViewCell.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/15/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class VenuesTableViewCell: UITableViewCell {

    var cellNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.init(name: "Rockwell-Bold", size: 16)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return nameLabel
    }()
    
    var cellAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var cellAddressTextView: UITextView = {
        let addressTextView = UITextView()
        addressTextView.dataDetectorTypes = [.address, .phoneNumber]
        addressTextView.textAlignment = .center
        addressTextView.font = UIFont.init(name: "Rockwell", size: 14)
        addressTextView.isEditable = false
        addressTextView.adjustsFontForContentSizeCategory = true
        addressTextView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addressTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return addressTextView
    }()
    
    var cellImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 130))
        image.backgroundColor = #colorLiteral(red: 0.810403645, green: 0.8105404973, blue: 0.8103856444, alpha: 1)
        return image
    }()
    
    func setTableViewCellConstraints() {
        setCellImageConstraints()
        setCellNameConstraints()
        setCellAddressConstraints()
    }

    private func setCellNameConstraints() {
        contentView.addSubview(cellNameLabel)
        cellNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellNameLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 2),
            cellNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellNameLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -2)])
    }
    private func setCellAddressConstraints() {
        contentView.addSubview(cellAddressTextView)
        cellAddressTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellAddressTextView.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2),
            cellAddressTextView.leadingAnchor.constraint(equalTo: cellNameLabel.leadingAnchor),
            cellAddressTextView.trailingAnchor.constraint(equalTo: cellNameLabel.trailingAnchor),
            cellAddressTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)])
    }
    
    private func setCellImageConstraints() {
        contentView.addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.widthAnchor.constraint(equalToConstant: cellImage.frame.width)])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTableViewCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
 
