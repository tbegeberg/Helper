//
//  Token.swift
//  App
//
//  Created by TørK on 07/08/2018.
//

import Vapor
import FluentMySQL
import Authentication

struct Token: HelperContent {
    var id: Int?
    var token: String
    var userId: User.ID
    
    init(token: String, userId: User.ID) {
        self.token = token
        self.userId = userId
    }
    
    static func createToken(forUser user: User) throws -> Token {
        let tokenString = self.randomToken(withLength: 60)
        let newToken = try Token(token: tokenString, userId: user.requireID())
        return newToken
    }
    
    static func randomToken(withLength length: Int) -> String {
        let allowedChars = "$!abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.count)
        var randomString = ""
        for _ in 0..<length {
            let randomNumber = Int(arc4random_uniform(allowedCharsCount))
            let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNumber)
            let newCharacter = allowedChars[randomIndex]
            randomString += String(newCharacter)
        }
        return randomString
    }
}

extension Token {
    var user: Parent<Token, User> {
        return parent(\.userId)
    }
}






