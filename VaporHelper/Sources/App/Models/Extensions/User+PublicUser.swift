//
//  User+PublicUser.swift
//  App
//
//  Created by TørK on 08/08/2018.
//

import Foundation
import Vapor

extension User {
    struct PublicUser: Content {
        var username: String
        var token: String
        var userID: UUID
    }
}
