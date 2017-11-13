//
//  MainMenuViewController.swift
//  inAlmaty
//
//  Created by Sharafat on 06.11.2017.
//  Copyright © 2017 KBTU. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    var categories: [[String: Any]] = [
        ["name": "Nature",
         "image": "nature-icon"],
        ["name": "Food",
         "image": "food-icon"],
        ["name": "Hotels",
         "image": "hotel-icon"],
        ["name": "Taxi",
         "image": "taxi-icon"],
        ["name": "Shops",
         "image": "shop-icon"],
        ["name": "Cinema",
         "image": "cinema-icon"],
        ["name": "Bowling",
         "image": "bowling-icon"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Categories"
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as! CategoryCollectionViewCell
        let category = categories[indexPath.row]
        
        cell.mainView.layer.borderWidth = 1
        cell.mainView.layer.borderColor = UIColor(red: 140 / 255, green: 197 / 255, blue: 71 / 255, alpha: 1).cgColor
        cell.mainView.layer.cornerRadius = 10
        cell.mainView.clipsToBounds = true
        
        cell.categoryImageView.image = UIImage(named: category["image"] as! String)
        cell.categoryName.text = category["name"] as? String
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 16 * 2 - 8) / 2
        
        return CGSize(width: width, height: width)
    }
    
}
