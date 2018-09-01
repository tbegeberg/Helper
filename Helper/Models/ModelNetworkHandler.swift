//
//  File.swift
//  Helper
//
//  Created by TørK on 05/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

protocol ModelNetworkHandler {
    associatedtype T: Codable
    func get(token: String,completionHandler: @escaping (Result<[T]>) -> ())
    func post(token: String, model: T, completionHandler: @escaping (Result<T>)->())
    func delete(token: String, id: HelperContentID, completionHandler: @escaping (Result<T>)->())
    func patch(token: String, model: T, completionHandler: @escaping (Result<T>)->())
}


extension LoginRequest {

    func createLogin(model: LoginRequest, completionHandler: @escaping (Result<CreateLoginSuccess>) -> ()) {
        NetworkHandler.shared.post(post: model, url: "http://localhost:8080/createUser", completionHandler: completionHandler)
    }
    
    func login(model: LoginRequest, completionHandler: @escaping (Result<LoginSuccess>) -> ()) {
        NetworkHandler.shared.post(post: model, url: "http://localhost:8080/loginUser", completionHandler: completionHandler)
    }
    
}



extension Assignment: ModelNetworkHandler {
    
    typealias T = Assignment
    
    func get(token: String, completionHandler: @escaping (Result<[Assignment]>) -> ()) {
        NetworkHandlerAuth.shared.getAuth(url: "http://localhost:8080/getAssignment", token: token, completionHandler: completionHandler)
    }
    func post(token: String, model: Assignment, completionHandler: @escaping (Result<Assignment>) -> ()) {
        NetworkHandlerAuth.shared.postAuth(post: model, url: "http://localhost:8080/postAssignment", token: token, completionHandler: completionHandler)
    }
    func delete(token: String, id: HelperContentID, completionHandler: @escaping (Result<Assignment>) -> ()) {
        NetworkHandlerAuth.shared.deleteAuth(url: "http://localhost:8080/deleteAssignment/\(id)", token: token, completionHandler: completionHandler)
    }
    func patch(token: String, model: Assignment, completionHandler: @escaping (Result<Assignment>) -> ()) {
        NetworkHandlerAuth.shared.patchAuth(post: model, url: "http://localhost:8080/patchAssignment", token: token, completionHandler: completionHandler)
    }
}












