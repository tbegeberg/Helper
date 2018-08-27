//
//  UserAuthenticated.swift
//  Helper
//
//  Created by TørK on 23/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class UserAuthenticated: State {
  
    var user: User.PublicUser
    
    init(user: User.PublicUser) {
        self.user = user
    }
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        
    }
    
    func enterState(context: AppContext) {
        print("Changed")
    }
    
    func buttonClicked(context: AppContext, user: User.PublicUser) {
        
    }
}




