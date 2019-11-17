//
//  FaveCollectionVC.swift
//  Foursquare-Map-Project
//
//  Created by Eric Widjaja on 11/5/19.
//  Copyright © 2019 Eric W. All rights reserved.
//

import UIKit

class FaveCollectionVC: UIViewController {
    
    private var venuesCollections = [FaveCollections]() {
        didSet {
            
            venuesCollectionsCV.reloadData()}
    }
    
    var venuesCollectionsCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 175, height: 120)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .darkGray
        collection.register(FavoritesCellCollectionViewCell.self, forCellWithReuseIdentifier: "faveCell")
        return collection
    }()
    
    var navigationBar: UINavigationBar = {
        let bar = UINavigationBar()
        bar.barTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return bar
    }()
    
    var navItem: UINavigationItem = {
        let item = UINavigationItem(title: "VENUES COLLECTIONS")
        return item
    }()
    
    lazy var addButton: UIBarButtonItem = {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        add.tintColor = .white
        return add
    }()
    
    lazy var backButton: UIBarButtonItem = {
        let backSearchVC = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(backButtonPressed))
        backSearchVC.tintColor = .white
        return backSearchVC
    }()
    
    //MARK: - SetUpConstraints
    private func setFaveCollection() {
        setDelegates()
        setupNavBar()
        setNavBarConstraints()
        setCollectionViewConstraints()
    }
    
    private func setNavBarConstraints() {
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
    }

    private func setupNavBar() {
        navigationBar.items = [navItem]
        navItem.rightBarButtonItem = addButton
        navItem.leftBarButtonItem = backButton
    }
    
    private func setCollectionViewConstraints() {
        view.addSubview(venuesCollectionsCV)
        venuesCollectionsCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venuesCollectionsCV.topAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: 30),
            venuesCollectionsCV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            venuesCollectionsCV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            venuesCollectionsCV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
    }

    
    
    //MARK: - Functions
    @objc func backButtonPressed(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonPressed() {
        let addCreate2FaveVC = AddCreateCollectionVC()
        
        
        
        present(addCreate2FaveVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        setFaveCollection()
        

        // Do any additional setup after loading the view.
    }

    
    private func setDelegates() {
        venuesCollectionsCV.delegate = self
        venuesCollectionsCV.dataSource = self
    }
    
    private func loadFaveCollection() {
        print("more code here - persistence")
        do { let persistedCollections = try CollectionPersistence.helper.getVenues();     venuesCollections = persistedCollections
        } catch {
            print(error)
        }
    }
}
//MARK: - Extentions

extension FaveCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "faveCell", for: indexPath) as? FavoritesCellCollectionViewCell else {
            return UICollectionViewCell()
        }
        let collection = venuesCollections[indexPath.row]
        cell.nameLabel.text = collection.title
        cell.addButton.isHidden = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collection = venuesCollections[indexPath.row]
        let venueTableVC = VenuesListTableVC()
        venueTableVC.tblViewCellVenues = collection.venues
        present(venueTableVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        venuesCollections.count
    }
}
extension FaveCollectionVC: ReloadVenues {
    func reloadFaveCollectionView() {
       loadFaveCollection()
    }
}
