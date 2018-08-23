//
//  LoginViewController.swift
//  Helper
//
//  Created by TørK on 15/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    let textViewFactory = TextViewFactory()
    let uiControlFactory = UIControlFactory()
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    var enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.usernameTextField = textViewFactory.buildTextField()
        self.passwordTextField = textViewFactory.buildTextField()
        self.enterButton = uiControlFactory.buildButton(title:"Enter")

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
        
        self.view.addSubview(enterButton)
        self.enterButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTextField).offset(40)
            make.centerX.equalTo(self.view)
        }
        enterButton.addTarget(self, action: #selector(enterLogin(sender:)), for: UIControlEvents.touchUpInside)
        
        
    }

    @objc func enterLogin (sender: UIButton) {
        guard let username = usernameTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
       
        let userLoginDetail = User(id: nil, username: username, password: password, userID: nil, image: nil)
        userLoginDetail.login(model: userLoginDetail) { (result) in
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
