//
//  Token + BearerAuth.swift
//  App
//
//  Created by TørK on 07/08/2018.
//

import Authentication

extension Token: BearerAuthenticatable {
    static var tokenKey: WritableKeyPath<Token, String> { return \Token.token }
}
