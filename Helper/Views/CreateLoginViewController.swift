//
//  CreateUserViewController.swift
//  Helper
//
//  Created by TørK on 27/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import SnapKit

class CreateLoginViewController: UIViewController {
    
    let textViewFactory = TextViewFactory()
    let uiControlFactory = UIControlFactory()
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    var createButton = UIButton()
    weak var responder: AuthenticationViewResponder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Create Login"
        
        self.usernameTextField = textViewFactory.buildTextField()
        self.passwordTextField = textViewFactory.buildTextField()
        self.createButton = uiControlFactory.buildButton(title:"Create")
        
        self.view.addSubview(usernameTextField)
        self.usernameTextField.placeholder = "Enter Username"
        self.usernameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.centerX.equalTo(self.view)
        }
        
        self.view.addSubview(passwordTextField)
        self.passwordTextField.placeholder = "Enter password"
        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.usernameTextField).offset(40)
            make.centerX.equalTo(self.view)
        }
        
        self.view.addSubview(createButton)
        self.createButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTextField).offset(40)
            make.centerX.equalTo(self.view)
        }
        createButton.addTarget(self, action: #selector(createLogin(sender:)), for: UIControlEvents.touchUpInside)
    }
    
    @objc func createLogin (sender: UIButton) {
        guard let username = usernameTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        
        let userLoginDetail = User(id: nil, username: username, password: password, userID: UUID())
        
        userLoginDetail.createUser(model: userLoginDetail) { (result: Result<User.PublicUser>) in
            switch result {
            case .success(let value):
                self.responder?.buttonClicked(user: value)
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
