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
   
    func create(_ request: Request) throws -> Future<User.PublicUser> {
        return try request.content.decode(User.self).flatMap(to: User.PublicUser.self) { user in
            let passwordHashed = try request.make(BCryptDigest.self).hash(user.password)
            let newUser = User(id: nil, username: user.username, password: passwordHashed, userID: user.userID, image: user.image)
            return newUser.save(on: request).flatMap(to: User.PublicUser.self) { createdUser in
                let accessToken = try Token.createToken(forUser: createdUser)
                return accessToken.save(on: request).map(to: User.PublicUser.self) { createdToken in
                    guard let userID = createdToken.userId as? UUID else {
                        throw "Missing userID"
                    }
                    let publicUser = User.PublicUser(username: createdUser.username, token: createdToken.token, userID: userID)
                    return publicUser
                }
            }
        }
    }
    
    func loginUser(_ request: Request) throws -> Future<User> {
        return try request.content.decode(User.self).flatMap(to: User.self) { user in
            let passwordVerifier = try request.make(BCryptDigest.self)
            return User.authenticate(username: user.username, password: user.password, using: passwordVerifier, on: request).unwrap(or: Abort.init(HTTPResponseStatus.unauthorized))
        }
    }

}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
