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
        let view = LoginViewController()
        context.present(view: view)
    }
    
    
    
}
