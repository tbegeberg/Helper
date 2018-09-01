//
//  UserAuthenticated.swift
//  Helper
//
//  Created by TørK on 23/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class AssignmentList: State {
    
    var loginSuccess: LoginSuccess
    
    init(loginSuccess: LoginSuccess) {
        self.loginSuccess = loginSuccess
    }
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        context.changeState(state: Login())
    }
    
    func enterState(context: AppContext) {
        let view = AssignmentTableViewController()
        let loginButton = UIBarButtonItemActionable(title: "Login")
        loginButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        view.navigationItem.setLeftBarButton(loginButton, animated: true)
        context.present(view: view)
        view.getOwnAssigments(publicUser: loginSuccess)
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }
   
}




