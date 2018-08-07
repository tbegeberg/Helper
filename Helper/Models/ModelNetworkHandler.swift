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
    func get(completionHandler: @escaping (Result<[T]>) -> ())
    func post(model: T, completionHandler: @escaping (Result<T>)->())
    func delete(id: HelperContentID, completionHandler: @escaping (Result<T>)->())
    func patch(model: T, completionHandler: @escaping (Result<T>)->())
}


extension User: ModelNetworkHandler {
   
    typealias T = User
    
    func get(completionHandler: @escaping (Result<[User]>) -> ()) {
        NetworkHandler.shared.get(url: "http://localhost:8080/getUser", completionHandler: completionHandler)
    }
    func post(model: User, completionHandler: @escaping (Result<User>) -> ()) {
        NetworkHandler.shared.post(post: model, url: "http://localhost:8080/postUser", completionHandler: completionHandler)
    }
    func delete(id: HelperContentID, completionHandler: @escaping (Result<User>) -> ()) {
        NetworkHandler.shared.delete(url: "http://localhost:8080/deleteUser/\(id)", completionHandler: completionHandler)
    }
    func patch(model: User, completionHandler: @escaping (Result<User>) -> ()) {
        NetworkHandler.shared.patch(post: model, url: "http://localhost:8080/patchUser", completionHandler: completionHandler)
    }
}

extension Helping: ModelNetworkHandler {
    
    typealias T = Helping
    
    func get(completionHandler: @escaping (Result<[Helping]>) -> ()) {
        NetworkHandler.shared.get(url: "http://localhost:8080/getHelping", completionHandler: completionHandler)
    }
    func post(model: Helping, completionHandler: @escaping (Result<Helping>) -> ()) {
        NetworkHandler.shared.post(post: model, url: "http://localhost:8080/postHelping", completionHandler: completionHandler)
    }
    func delete(id: HelperContentID, completionHandler: @escaping (Result<Helping>) -> ()) {
        NetworkHandler.shared.delete(url: "http://localhost:8080/deleteHelping/\(id)", completionHandler: completionHandler)
    }
    func patch(model: Helping, completionHandler: @escaping (Result<Helping>) -> ()) {
        NetworkHandler.shared.patch(post: model, url: "http://localhost:8080/patchHelping", completionHandler: completionHandler)
    }
}

extension Assignment: ModelNetworkHandler {
    
    typealias T = Assignment
    
    func get(completionHandler: @escaping (Result<[Assignment]>) -> ()) {
        NetworkHandler.shared.get(url: "http://localhost:8080/getAssignment", completionHandler: completionHandler)
    }
    func post(model: Assignment, completionHandler: @escaping (Result<Assignment>) -> ()) {
        NetworkHandler.shared.post(post: model, url: "http://localhost:8080/postAssignment", completionHandler: completionHandler)
    }
    func delete(id: HelperContentID, completionHandler: @escaping (Result<Assignment>) -> ()) {
        NetworkHandler.shared.delete(url: "http://localhost:8080/deleteAssignment/\(id)", completionHandler: completionHandler)
    }
    func patch(model: Assignment, completionHandler: @escaping (Result<Assignment>) -> ()) {
        NetworkHandler.shared.patch(post: model, url: "http://localhost:8080/patchAssignment", completionHandler: completionHandler)
    }
}












