//
//  DetailVC.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/10/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
 
    //MARK: - Properties
    let detailView = DetailView()
    var venue: VenueStruct!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(detailView)
        detailView.detailVenueName.text = venue.name
        detailView.detailVenueAddress.text = venue.location.formattedAddress[0] + "\n" + venue.location.formattedAddress[1]
        
        
    }
}
