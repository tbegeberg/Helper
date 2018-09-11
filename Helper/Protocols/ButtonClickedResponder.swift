//
//  file.swift
//  Helper
//
//  Created by TørK on 23/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

protocol ButtonClickedResponder {
    func createLogin(loginSuccess: LoginSuccess)
    func login(loginSuccess: LoginSuccess)
    func createAssignment()
}
 
