//
//  LoadAssignments.swift
//  Helper
//
//  Created by TørK on 16/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class LoadAssignment: State {
    
    var loginCredentials: LoginCredentials
    
    init(loginCredentials: LoginCredentials) {
        self.loginCredentials = loginCredentials
    }
    
    
    func forward(context: AppContext) {
        
    }
    
    func back(context: AppContext) {
        
    }
    
    func enterState(context: AppContext) {
        NetworkHandlerAuth.shared.getAuth(url: "http://localhost:8080/getAssignment", token: loginCredentials.token) { (result: Result<[Assignment]>) in
            switch result {
            case .success(let value):
                context.changeState(state: ShowOwnAssignment(assigment: value, loginCredentials: self.loginCredentials))
            case .error(let error):
                print(error)
            case .serverError(let error):
                print(error)
            case .successNoValue(let value):
                print(value)
            }
        }
        
    }
    
    func buttonClicked(context: AppContext, loginSuccess: LoginSuccess) {
        
    }

}
