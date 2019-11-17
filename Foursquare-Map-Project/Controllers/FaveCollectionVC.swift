//
//  FaveCollectionVC.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/5/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class FaveCollectionVC: UIViewController {

    var venuesCollections = [FaveCollections]() {
        didSet {
            venuesCollectionsCV.reloadData()}
    }
    
    var venuesCollectionsCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 150, height: 150)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(FavoritesCellCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        return collection
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)

        // Do any additional setup after loading the view.
    }

}
