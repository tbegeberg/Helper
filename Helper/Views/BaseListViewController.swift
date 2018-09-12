//
//  BaseTableViewController.swift
//  Helper
//
//  Created by TørK on 04/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import CoreLocation

class BaseListViewController: UITableViewController, CLLocationManagerDelegate {
    
    var list = [Listable]()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.reloadData()
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.stopUpdatingLocation()
        }
        print(self.locationManager.location?.coordinate)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let list = self.list[indexPath.row]
        cell.textLabel?.text = "\(list.title) - \(list.subtitle)"
        return cell
    }

  
}
