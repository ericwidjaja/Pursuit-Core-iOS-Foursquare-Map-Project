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
    var venue: VenueStruct?
    
    //MARK: - Objects
    var navBar: UINavigationBar = {
        let bar = UINavigationBar()
        bar.barTintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        return bar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
