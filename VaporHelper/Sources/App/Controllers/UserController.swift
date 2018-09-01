//
//  ProfileController.swift
//  App
//
//  Created by TørK on 29/07/2018.
//

import Foundation
import Vapor
import Authentication

final class UserController {
  
    
    func create(_ request: Request) throws -> Future<LoginSuccess> {
        return try request.content.decode(LoginRequest.self).flatMap { login in
            let passwordHashed = try request.make(BCryptDigest.self).hash(login.password)
            guard let userID = login.userID as? UUID else {
                throw "UserID is not a UUID"
            }
            let user = User(id: login.id, username: login.username, password: passwordHashed, userID: userID)
            return user.save(on: request).flatMap { createdLogin in
                let accessToken = try Token.createToken(forUser: createdLogin)
                return accessToken.save(on: request).map { createdToken in
                    return LoginSuccess(id: nil, username: createdLogin.username, token: createdToken.token, userID: userID)
                }
            }
        }
    }
    
    
    
    
    func loginUser(_ request: Request) throws -> Future<LoginSuccess> {
        return try request.content.decode(LoginRequest.self).flatMap(to: LoginSuccess.self) { login in
            let passwordVerifier = try request.make(BCryptDigest.self)
            let futureUser = User.authenticate(username: login.username, password: login.password, using: passwordVerifier, on: request).unwrap(or: Abort.init(HTTPResponseStatus.unauthorized))
            let futureLogin = futureUser.map(to: LoginSuccess.self, { (user) -> LoginSuccess in
                guard let userID = user.userID as? UUID else {
                    throw "UserID is not a UUID"
                }
                let accessToken = try Token.createToken(forUser: user)
                accessToken.save(on: request)
                return LoginSuccess(id: nil, username: user.username, token: accessToken.token, userID: userID)
            })
            return futureLogin
        }
    }
}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
