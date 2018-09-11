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
        context.changeState(state: CreateAssignment(loginSuccess: loginSuccess))
    }
    
    func enterState(context: AppContext) {
        let view = AssignmentListTableViewController()
        let createAssignmentButton = UIBarButtonItemActionable(title: "Create")
        createAssignmentButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        view.navigationItem.setLeftBarButton(createAssignmentButton, animated: true)
        context.present(view: view)
        view.getOwnAssigments(loginSuccess: loginSuccess)
        
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }
   
}




