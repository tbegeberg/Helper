//
//  Login.swift
//  Helper
//
//  Created by TørK on 16/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

class UserLogin: State {
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        
    }
    
    func enterState(context: AppContext) {
        let responder: AuthenticationViewResponder = context
        let view = LoginViewController()
        view.responder = responder
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, user: User.PublicUser) {
        context.changeState(state: UserAuthenticated(user: user))
    }
    
}
