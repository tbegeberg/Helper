//
//  User+PublicUser.swift
//  Helper
//
//  Created by TørK on 08/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

extension User {
    struct PublicUser: HelperContent {
        var username: String
        var token: String
    }
}
