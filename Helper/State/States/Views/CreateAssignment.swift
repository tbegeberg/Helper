//
//  CreateAssignment.swift
//  Helper
//
//  Created by TørK on 01/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class CreateAssignment: State {
    
    var loginCredentials: LoginCredentials
    
    init(loginCredentials: LoginCredentials) {
        self.loginCredentials = loginCredentials
    }
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        context.changeState(state: LoadAssignment(loginCredentials: self.loginCredentials))
    }
    
    func enterState(context: AppContext) {
        let responder: AssignmentViewResponder = context
        let view = CreateAssignmentViewController()
        view.loginCredentials = self.loginCredentials
        view.responder = responder
        let listAssignmentButton = UIBarButtonItemActionable(title: "Assignments")
        listAssignmentButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        view.navigationItem.setLeftBarButton(listAssignmentButton, animated: true)
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
      
    }
    
    
    
}
