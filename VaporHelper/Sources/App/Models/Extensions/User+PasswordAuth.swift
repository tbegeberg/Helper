//
//  File.swift
//  App
//
//  Created by TørK on 08/08/2018.
//

import Authentication

extension User: PasswordAuthenticatable {
    static var usernameKey: WritableKeyPath<User, String> { return \User.username }
    static var passwordKey: WritableKeyPath<User, String> { return \User.password }
}
