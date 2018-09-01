//
//  CreateAssignment.swift
//  Helper
//
//  Created by TørK on 01/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class CreateAssignment: State {
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        
    }
    
    func enterState(context: AppContext) {
        let view = CreateAssignmentViewController()
        context.present(view: view)
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }
    
    
    
}
