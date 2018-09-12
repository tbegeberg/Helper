//
//  CreateAssignmentViewController.swift
//  Helper
//
//  Created by TørK on 01/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation

class CreateAssignmentViewController: BaseLocationViewController {

    var loginCredentials: LoginCredentials?
    var headlineTextField = UITextField()
    var requirementsTextField = UITextField()
    var creatAssignmentButton = UIButton()
    weak var responder: AssignmentViewResponder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Create Assignment"
        
        let textViewFactory = TextViewFactory()
        let uiControlFactory = UIControlFactory()
        self.headlineTextField = textViewFactory.buildTextField()
        self.requirementsTextField = textViewFactory.buildTextField()
        self.creatAssignmentButton = uiControlFactory.buildButton(title: "Create")
        
        self.view.addSubview(headlineTextField)
        self.headlineTextField.placeholder = "Enter Assignment Headline"
        self.headlineTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.centerX.equalTo(self.view)
        }
        
        self.view.addSubview(requirementsTextField)
        self.requirementsTextField.placeholder = "Enter requirements Headline"
        self.requirementsTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.headlineTextField).offset(100)
            make.centerX.equalTo(self.view)
        }
        
        self.view.addSubview(creatAssignmentButton)
        self.creatAssignmentButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.requirementsTextField).offset(100)
            make.centerX.equalTo(self.view)
        }
        
        self.creatAssignmentButton.addTarget(self, action: #selector(createButtonClicked), for: UIControlEvents.touchUpInside)
        
        
    }
    
    @objc func createButtonClicked() throws{
        guard let credentials = self.loginCredentials as? LoginCredentials else {
            throw ErrorAssignement.noCredentials
        }
        
        guard let headline = self.headlineTextField.text as? String else {
            throw ErrorAssignement.noHeadline
        }
        
        guard let requirements = self.requirementsTextField.text as? String else {
            throw ErrorAssignement.noRequirements
        }
        
        guard let newLocation = locationManager.location as? CLLocation else {
            throw ErrorAssignement.noLocation
        }
        
        let location = Location(id: nil, latitude: newLocation.coordinate.latitude, longitude: newLocation.coordinate.longitude)
        let assignment = Assignment(id: nil, beneficiaryID: credentials.userID, assignmentID: UUID(), location: location, headline: headline, requirements: requirements, image: nil)
        NetworkHandlerAuth.shared.postAuth(post: assignment, url: "http://localhost:8080/postAssignment", token: credentials.token) { (result: Result<Assignment>) in
            switch result {
            case .success(let value):
                print(value)
                self.responder?.createAssignment()
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
