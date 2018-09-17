//
//  DoAssignmentListTableViewController.swift
//  Helper
//
//  Created by TørK on 11/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import CoreLocation

class AcceptAssignmentListController: BaseListViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    func getAssigments(loginSuccess: LoginSuccess) {
        NetworkHandlerAuth.shared.getAuth(url: "http://localhost:8080/getAssignment", token: loginSuccess.token) { (result: Result<[Assignment]>) in
            switch result {
            case .success(let value):
                for assignment in value {
                    if assignment.beneficiaryID != loginSuccess.userID {
                        let location = CLLocation(latitude: assignment.location.latitude, longitude: assignment.location.longitude)
                        guard let distance = self.locationManager.location?.distance(from: location) as? Double else {
                            return
                        }
                        if distance < 5000 {
                            self.list.append(assignment)
                            self.tableView.reloadData()
                        } 
                    }
                }
            case .error(let error):
                print(error)
            case .serverError(let error):
                print(error)
            case .successNoValue(let value):
                print(value)
            }
        }
        
    }

}
