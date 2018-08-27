//
//  State.swift
//  Helper
//
//  Created by TørK on 15/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

protocol State {
    func forward(context: AppContext)
    func back(context: AppContext)
    func enterState(context: AppContext)
    func buttonClicked(context: AppContext, user: User.PublicUser)
}
