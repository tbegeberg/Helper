//
//  LoginSuccess.swift
//  App
//
//  Created by TørK on 30/08/2018.
//

import Foundation

struct LoginSuccess: HelperContent {
    var id: Int?
    var username: String
    var token: String
    let userID: UUID
}

typealias CreateLoginSuccess = LoginSuccess
typealias LoginCredentials = LoginSuccess
