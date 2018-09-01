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
    
        return assigments.count
    }
    
    
    
    
    
    func getOwnAssigments(loginSuccess: LoginSuccess) {
        NetworkHandlerAuth.shared.getAuth(url: "http://localhost:8080/getAssignment", token: loginSuccess.token) { (result: Result<[Assignment]>) in
            switch result {
            case .success(let value):
                for assignment in value {
                    if assignment.beneficiaryID == loginSuccess.userID {
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
    
    func createAssignment(token: String, beneficiaryID: UUID) {
        let location = Location(id: nil, latitude: 40.22, longitude: 20.2)
        let assignment = Assignment(id: nil, beneficiaryID: beneficiaryID, assignmentID: UUID(), location: location, headline: "NEED HELP", requirements: "TOOLS", image: nil)
        NetworkHandlerAuth.shared.postAuth(post: assignment, url: "http://localhost:8080/postAssignment", token: token) { (result: Result<Assignment>) in
            switch result {
            case .success(let value):
                print(value)
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
