//
//  File.swift
//  Helper
//
//  Created by TørK on 15/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

protocol AppContext: AuthenticationViewResponder, AssignmentViewResponder {
    var state:State? { get set }
    func present(view: ViewProvider)
    func changeState(state: State)
}

extension ButtonClickedResponder where Self:AppContext {
    func createLogin(loginSuccess: LoginSuccess) {
        self.state?.buttonClicked(context: self, loginSuccess: loginSuccess)
    }
    func login(loginSuccess: LoginSuccess) {
        self.state?.buttonClicked(context: self, loginSuccess: loginSuccess)
    }
    func createAssignment() {
        self.state?.back(context: self)
    }
    
}
