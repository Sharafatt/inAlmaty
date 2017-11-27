//
//  PlaceViewController.swift
//  inAlmaty
//
//  Created by Sharafat on 12.11.2017.
//  Copyright © 2017 KBTU. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!
    
    var place: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Place"
        
        tableView.estimatedRowHeight = 200   
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
         case 0: return 200  
        default: return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath) as! PlaceImageTableViewCell
            
            cell.iconImageView.image = UIImage(named: place["image"] as! String)
            cell.nameLabel.text = (place["name"] as? String)?.uppercased()
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Main Information", for: indexPath) as! PlaceMainInformationTableViewCell
            
            cell.mainView.layer.borderWidth = 1
            cell.mainView.layer.borderColor = UIColor(red: 140 / 255, green: 197 / 255, blue: 71 / 255, alpha: 1).cgColor
            cell.mainView.layer.cornerRadius = 10
            cell.mainView.clipsToBounds = true
            
            cell.mainInformationLabel.text = place["main_information"] as? String
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Other Information", for: indexPath) as! PlaceOtherInformationTableViewCell
            
            cell.mainView.layer.borderWidth = 1
            cell.mainView.layer.borderColor = UIColor(red: 140 / 255, green: 197 / 255, blue: 71 / 255, alpha: 1).cgColor
            cell.mainView.layer.cornerRadius = 10
            cell.mainView.clipsToBounds = true
            
            cell.otherInformationLabel.text = place["other_information"] as? String
            
            return cell
        }
    }

}
