//
//  VenuesListTableVC.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/4/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class VenuesListTableVC: UIViewController {
    
        var tblViewCellVenues = [VenueStruct]()
        
        
        //MARK: - Objects
        lazy var venueTableView: UITableView = {
            let venueTView = UITableView()
            venueTView.register(VenuesTableViewCell.self, forCellReuseIdentifier: "tableCell")
            venueTView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            return venueTView
        }()
    
        lazy var backButton: UIButton = {
            let bckButton = UIButton(type: UIButton.ButtonType.system)
            bckButton.setTitle("BACK", for: .normal)
            bckButton.setTitleColor(.white, for: .normal)
            bckButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
            return bckButton
        }()
        
        //MARK: - Functions
        func setDelegates() {
            venueTableView.delegate = self
            venueTableView.dataSource = self
        }
    
        @objc func backButtonPressed() {
            dismiss(animated: true, completion: nil)
        }
        
        //MARK: - Constraints
        func setTableViewControllerUI() {
            setDelegates()
            setButtonConstraints()
            setTableConstraints()
        }
        func setButtonConstraints() {
            view.addSubview(backButton)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
                backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100)])
        }
        func setTableConstraints() {
            view.addSubview(venueTableView)
            venueTableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                venueTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
                venueTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                venueTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                venueTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        }
        

        //MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            setTableViewControllerUI()
        }
    
        override func viewWillAppear(_ animated: Bool) {
            venueTableView.reloadData()
        }
    }

    extension VenuesListTableVC: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tblViewCellVenues.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as? VenuesTableViewCell else {
                return UITableViewCell()
            }
            let venue = tblViewCellVenues[indexPath.row]
            cell.cellNameLabel.text = venue.name
            cell.cellAddressTextView.text = venue.location.formattedAddress[0] + "\n" + venue.location.formattedAddress[1]
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
        
    }

