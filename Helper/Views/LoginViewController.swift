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

    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(usernameTextField)
        self.usernameTextField.placeholder = "Enter Username"
        self.usernameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
