//
//  Login.swift
//  Helper
//
//  Created by TørK on 16/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

class Login: State {
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        context.changeState(state: CreateLogin())
    }
    
    func enterState(context: AppContext) {
        let responder: AuthenticationViewResponder = context
        let view = LoginViewController()
        view.responder = responder
        let createLoginButton = UIBarButtonItemActionable(title: "Create")
        createLoginButton.actionBlock = {
            [weak self]
            () -> () in
            self?.back(context: context)
        }
        view.navigationItem.setRightBarButton(createLoginButton, animated: true)
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, user: User.PublicUser) {
        context.changeState(state: UserAuthenticated(user: user))
    }
    
}
