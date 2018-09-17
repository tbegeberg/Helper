//
//  DoAssignments.swift
//  Helper
//
//  Created by TørK on 12/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class AcceptAssignment: State {
    
    var assigment: [Assignment]
    var loginCredentials: LoginCredentials
    
    init(assigment: [Assignment], loginCredentials: LoginCredentials) {
        self.assigment = assigment
        self.loginCredentials = loginCredentials
    }
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        context.changeState(state: LoadAssignment(loginCredentials: self.loginCredentials))
    }
    
    func enterState(context: AppContext) {
        let view = AssignmentListController()
        view.assignment = self.assigment
        let listAssignmentButton = UIBarButtonItemActionable(title: "Assignments")
        listAssignmentButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        view.navigationItem.setLeftBarButton(listAssignmentButton, animated: true)
        view.listOthersAssignments(loginCredentials: loginCredentials)
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }
}
