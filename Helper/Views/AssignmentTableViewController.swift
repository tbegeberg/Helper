//
//  AssignmentTableViewController.swift
//  Helper
//
//  Created by TørK on 28/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit

class AssignmentTableViewController: UITableViewController {

    var assigments = [Assignment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        
    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    
    func getOwnAssigments(publicUser: LoginSuccess) {
        NetworkHandlerAuth.shared.getAuth(url: "http://localhost:8080/getAssignment", token: publicUser.token) { (result: Result<[Assignment]>) in
            switch result {
            case .success(let value):
                for assignment in value {
                    if assignment.beneficiaryID == publicUser.userID {
                        print(assignment)
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
