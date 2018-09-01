//
//  CreateUserViewController.swift
//  Helper
//
//  Created by TørK on 27/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import SnapKit

class CreateLoginViewController: LoginViewController {
    
    var createButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Login"
        self.createButton = uiControlFactory.buildButton(title:"Create")
        self.usernameTextField.placeholder = "Enter Username"
        self.passwordTextField.placeholder = "Enter password"
        
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
        
        let createLogin = LoginRequest(id: nil, username: username, password: password, userID: UUID())
        
        createLogin.createLogin(model: createLogin) { (result: Result<CreateLoginSuccess>) in
            switch result {
            case .success(let value):
                self.responder?.buttonClicked(loginSuccess: value)
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
