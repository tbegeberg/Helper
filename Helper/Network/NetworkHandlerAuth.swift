//
//  NetworkHandlerAuth.swift
//  Helper
//
//  Created by TørK on 10/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class NetworkHandlerAuth {
    
    let networkHandler = NetworkHandler()
    static let shared = NetworkHandlerAuth()
    
    func getAuth<T: Codable> (url: String, token: String, completionHandler: @escaping (Result<T>)->()) {
        let request = createRequestAuth(url: url, method: "GET", token: token)
        let task = networkHandler.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func postAuth<T: Codable, P: Codable> (post: T, url: String, token: String, completionHandler: @escaping (Result<P>)->()) {
        let jsonData = networkHandler.encode(post: post, completionHandler: completionHandler)
        var request = createRequestAuth(url: url, method: "POST", token: token)
        request.httpBody = jsonData
        let task = networkHandler.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func patchAuth<T: Codable> (post: T, url: String, token: String, completionHandler: @escaping (Result<T>)->()) {
        let jsonData = networkHandler.encode(post: post, completionHandler: completionHandler)
        var request = createRequestAuth(url: url, method: "PATCH", token: token)
        request.httpBody = jsonData
        let task = networkHandler.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func deleteAuth<T: Codable> (url: String, token: String, completionHandler: @escaping (Result<T>)->()) {
        let request = createRequestAuth(url: url, method: "DELETE", token: token)
        let task = networkHandler.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func createRequestAuth (url: String, method: String, token: String) -> URLRequest {
        guard let url = URL(string: url) else { fatalError("Could not create URL from components") }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        return request
    }
    
}
