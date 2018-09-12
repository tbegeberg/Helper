//
//  DoAssignmentListTableViewController.swift
//  Helper
//
//  Created by TørK on 11/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import CoreLocation

class DoAssignmentListTableViewController: BaseListViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
           
        }
        print(self.locationManager.location?.coordinate)
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
                        if distance > 5000 {
                            print("to far away")
                        } else {
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
