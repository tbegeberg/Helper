//
//  DoAssignments.swift
//  Helper
//
//  Created by TørK on 12/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class AcceptAssignment: State {
    
    var loginSuccess: LoginSuccess
    
    init(loginSuccess: LoginSuccess) {
        self.loginSuccess = loginSuccess
    }
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        context.changeState(state: ShowOwnAssignment(loginCredentials: loginSuccess))
    }
    
    func enterState(context: AppContext) {
        let view = AcceptAssignmentListController()
        let listAssignmentButton = UIBarButtonItemActionable(title: "Assignments")
        listAssignmentButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        view.navigationItem.setLeftBarButton(listAssignmentButton, animated: true)
        view.getOthersAssigments(loginSuccess: loginSuccess)
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }
}
