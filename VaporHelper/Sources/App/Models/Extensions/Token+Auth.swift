//
//  Token + Auth.swift
//  App
//
//  Created by TørK on 07/08/2018.
//

import Authentication

extension Token: Authentication.Token {
    static var userIDKey: WritableKeyPath<Token, User.ID> {
        return \Token.userId
    }
    typealias UserType = User
    typealias UserIDType = User.ID
    
}
