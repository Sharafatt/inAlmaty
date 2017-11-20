//
//  PlacesViewController.swift
//  inAlmaty
//
//  Created by Sharafat on 12.11.2017.
//  Copyright © 2017 KBTU. All rights reserved.
//

import FirebaseDatabase
import UIKit

class PlacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!
    
    var category: [String: Any]!
    var places: [[String: Any]] = []
    
    func downloadPlaces() {
        let ref = Database.database().reference().child("places")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let placesArray = snapshot.value as! [[String: Any]]
            
            
            
            self.places = placesArray.filter({ place in
                return place["category_name"] as! String == self.category["name"] as! String
            })
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Places"
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = 200
        tableView.reloadData()
        
        downloadPlaces()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "Show Place":
            let destinationVC = segue.destination as! PlaceViewController
            destinationVC.place = sender as! [String: Any]
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Place", for: indexPath) as! PlaceTableViewCell
        let place = places[indexPath.row]
        
        cell.iconImageView.image = UIImage(named: place["image"] as! String)
        cell.nameLabel.text = (place["name"] as? String)?.uppercased()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Show Place", sender: places[indexPath.row])
    }
    
}
