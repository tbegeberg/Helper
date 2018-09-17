//
//  UserAuthenticated.swift
//  Helper
//
//  Created by TørK on 23/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class ShowOwnAssignment: State {
    
    var loginCredentials: LoginCredentials
    
    init(loginCredentials: LoginCredentials) {
        self.loginCredentials = loginCredentials
    }
    
    func forward(context: AppContext) {
        context.changeState(state: AcceptAssignment(loginSuccess: loginCredentials))
    }
    
    func back(context: AppContext) {
        context.changeState(state: CreateAssignment(loginSuccess: loginCredentials))
    }
    
    func enterState(context: AppContext) {
        let view = AssignmentListController()
        let createAssignmentButton = UIBarButtonItemActionable(title: "Create")
        let doAssignmentButton = UIBarButtonItemActionable(title: "Do")
        createAssignmentButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        doAssignmentButton.actionBlock = {
            [weak self]
            () -> () in
            self?.forward(context: context)
        }
        view.navigationItem.setLeftBarButton(createAssignmentButton, animated: true)
        view.navigationItem.setRightBarButton(doAssignmentButton, animated: true)
        view.getAssigments(loginCredentials: self.loginCredentials)
        view.listOwnAssignments(loginCredentials: self.loginCredentials)
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }
   
}




