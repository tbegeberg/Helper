//
//  CreateUser.swift
//  Helper
//
//  Created by TørK on 23/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class CreateLogin: State {
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        context.changeState(state: Login())
    }
    
    func enterState(context: AppContext) {
        let responder: AuthenticationViewResponder = context
        let view = CreateLoginViewController()
        view.responder = responder
        let loginButton = UIBarButtonItemActionable(title: "Login")
        loginButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        view.navigationItem.setLeftBarButton(loginButton, animated: true)
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, user: User.PublicUser) {
        context.changeState(state: UserAuthenticated(user: user))
        
    }
    
}
