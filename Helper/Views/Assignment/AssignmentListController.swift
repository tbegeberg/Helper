//
//  AssignmentTableViewController.swift
//  Helper
//
//  Created by TørK on 28/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import CoreLocation

class AssignmentListController: UITableViewController {
    
    var list = [Listable]()
    var assignment = [Assignment]()
    var location = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.reloadData()
       
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

    func listOwnAssignments(loginCredentials: LoginCredentials) {
        for value in self.assignment {
            if value.beneficiaryID == loginCredentials.userID {
                self.list.append(value)
                self.tableView.reloadData()
            }
        }
    }
    
    func listOthersAssignments(loginCredentials: LoginCredentials) {
        for assignment in self.assignment {
            if assignment.beneficiaryID != loginCredentials.userID {
                let location = CLLocation(latitude: assignment.location.latitude, longitude: assignment.location.longitude)
                guard let distance = self.location.distance(from: location) as? Double else {
                    return
                }
                if distance < 5000 {
                    self.list.append(assignment)
                    self.tableView.reloadData()
                }
            }
        }
    }
}
