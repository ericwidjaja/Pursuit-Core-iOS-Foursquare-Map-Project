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
        getVenueImage()
    }
    
    private func getVenueImage() {
        if let linkExists = venue.imageLink {
            if let imageIsInCache = ImageHelper.fetchImageFromCache(urlString: linkExists) {
                detailView.detailVenueImage.image = imageIsInCache
                detailView.activityIndicator.stopAnimating()
            } else {
                ImageHelper.fetchImageFromNetwork(urlString: linkExists) { (appError, image) in
                    if let appError = appError {
                        print("imageHelper in detail vc error = \(appError)")
                    } else if let image = image {
                        self.detailView.detailVenueImage.image = image
                        self.detailView.activityIndicator.stopAnimating()
                        print("Detail VC made network call for image")
                    }
                }
            }
        } else {
            ImageAPIClient.getImages(venueID: venue.id) { (appError, link) in
                if let appError = appError {
                    print("detailVC imageAPIClient error = \(appError)")
                } else if let link = link {
                    if let imageIsInCache = ImageHelper.fetchImageFromCache(urlString: link) {
                        self.detailView.detailVenueImage.image = imageIsInCache
                        self.detailView.activityIndicator.stopAnimating()
                    } else {
                        ImageHelper.fetchImageFromNetwork(urlString: link) { (appError, image) in
                            if let appError = appError {
                                print("imageHelper in detail vc error = \(appError)")
                            } else if let image = image {
                                self.detailView.detailVenueImage.image = image
                                self.detailView.activityIndicator.stopAnimating()
                                print("Detail VC made network call for image bc link wasn't available")
                            }
                        }
                    }
                }
            }
        }
    }
}
