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
    
    var place: [String: Any] = [
        "image": "kolsay-image",
        "name": "Kolsay lake",
        "main_description": "Kolsay Lakes is one of the most beautiful places of Kazakh nature. They are also called a blue necklace of Northern Tien Shan. And it is quite understandable – such beauty cannot be found anywhere! In the Kazakh language “Kolsay” means “a lake in the valley”, indeed, all three lakes are situated in the eastern part of the picturesque Kungei Tau gorge, 300 km from Almaty.",
        "other_information": "The lakes are located at 1,800m, 2,250m and 2,700m above sea level. The Kolsay River originates from glaciers, located in the Kungei Alatau mountain ridges, and falls, in turn, to each of the three lakes: Verkhneye, Mynzholki and Nizhneye. The water in the lakes is fresh. Kolsay Lakes are very deep. For example, the deepest place of the first lake is 80 m, while in the second – about 50 m. The bottom in some places is shallow without crags."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        
        tableView.tableFooterView = UIView()
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
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath) as! PlaceImageTableViewCell
            
            cell.iconImageView.image = UIImage(named: place["image"] as! String)
            cell.nameLabel.text = (place["name"] as? String)?.uppercased()
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Main Description", for: indexPath) as! PlaceDescriptionTableViewCell
            
            cell.mainView.layer.borderWidth = 1
            cell.mainView.layer.borderColor = UIColor(red: 140 / 255, green: 197 / 255, blue: 71 / 255, alpha: 1).cgColor
            cell.mainView.layer.cornerRadius = 10
            cell.mainView.clipsToBounds = true
            
            cell.mainDescriptionLabel.text = place["main_description"] as? String
            
            return cell
        default:
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
