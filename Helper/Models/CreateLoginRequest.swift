//
//  CreateLoginRequest.swift
//  App
//
//  Created by TørK on 31/08/2018.
//

import Foundation

struct CreateLoginRequest: HelperContent {
    var id: Int?
    var username: String
    var password: String
    let userID: UUID
    
}
