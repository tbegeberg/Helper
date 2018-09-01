//
//  CreateAssignmentViewController.swift
//  Helper
//
//  Created by TørK on 01/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit

class CreateAssignmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
