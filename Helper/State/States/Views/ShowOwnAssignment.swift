//
//  UserAuthenticated.swift
//  Helper
//
//  Created by TørK on 23/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class ShowOwnAssignment: State {
    
    var assigment: [Assignment]
    var loginCredentials: LoginCredentials
    
    init(assigment: [Assignment], loginCredentials: LoginCredentials) {
        self.assigment = assigment
        self.loginCredentials = loginCredentials
    }
    
    func forward(context: AppContext) {
        context.changeState(state: AcceptAssignment(assigment: self.assigment, loginCredentials: self.loginCredentials))
    }
    
    func back(context: AppContext) {
        context.changeState(state: CreateAssignment(loginCredentials: loginCredentials))
    }
    
    func enterState(context: AppContext) {
        let viewFactory = ViewFactory()
        let view = viewFactory.buildOwnAssignment(assignment: self.assigment, loginCredentials: self.loginCredentials)
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
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }
   
}




