//
//  AssignmentTableViewController.swift
//  Helper
//
//  Created by TørK on 28/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit

class AssignmentListTableViewController: BaseListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func getOwnAssigments(loginSuccess: LoginSuccess) {
        NetworkHandlerAuth.shared.getAuth(url: "http://localhost:8080/getAssignment", token: loginSuccess.token) { (result: Result<[Assignment]>) in
            switch result {
            case .success(let value):
                for assignment in value {
                    if assignment.beneficiaryID == loginSuccess.userID {
                        self.list.append(assignment)
                        self.tableView.reloadData()
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
