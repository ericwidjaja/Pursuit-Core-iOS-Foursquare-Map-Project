//
//  SearchViewController.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/5/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    let mainView = MainView()

    private func setMainView() {
        view.addSubview(mainView)
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainView()

        // Do any additional setup after loading the view.
    }
}
