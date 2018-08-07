//
//  Network.swift
//  Helper
//
//  Created by TørK on 01/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

class NetworkHandler {
    
    static let shared = NetworkHandler()
    
    func get<T: Codable> (url: String, completionHandler: @escaping (Result<T>)->()) {
        let request = createRequest(url: url, method: "GET")
        let task = self.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func post<T: Codable> (post: T, url: String, completionHandler: @escaping (Result<T>)->()) {
        let jsonData = self.encode(post: post, completionHandler: completionHandler)
        var request = createRequest(url: url, method: "POST")
        request.httpBody = jsonData
        let task = self.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func delete<T: Codable> (url: String, completionHandler: @escaping (Result<T>)->()) {
        let request = createRequest(url: url, method: "DELETE")
        let task = self.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func patch<T: Codable> (post: T, url: String, completionHandler: @escaping (Result<T>)->()) {
        let jsonData = self.encode(post: post, completionHandler: completionHandler)
        var request = createRequest(url: url, method: "PATCH")
        request.httpBody = jsonData
        let task = self.task(request: request, completionHandler: completionHandler)
        task.resume()
    }
    
    func createRequest (url: String, method: String) -> URLRequest {
        guard let url = URL(string: url) else { fatalError("Could not create URL from components") }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func encode<T: Codable>(post: T, completionHandler: @escaping (Result<T>)->()) -> Data {
        let encoder = JSONEncoder()
        var data = Data()
        do {
            data = try encoder.encode(post)
            print("jsonData: ", String(data: data, encoding: .utf8) ?? "no body data")
        } catch {
            completionHandler(Result.error(error))
        }
        return data
    }
    
    
    func decode<T: Codable>(data: Data, completionHandler: @escaping (Result<T>)->()) {
        let decode = JSONDecoder()
        do {
            let value = try decode.decode(T.self, from: data)
            DispatchQueue.main.async {
                completionHandler(Result.success(value))
            }
        } catch {
            DispatchQueue.main.async {
                completionHandler(Result.error(error))
            }
        }
    }
    
    func decocdeServerError<T: Codable>(data: Data, completionHandler: @escaping (Result<T>)->()) {
        let decode = JSONDecoder()
        do {
            let value = try decode.decode(ServerError.self, from: data)
            DispatchQueue.main.async {
                completionHandler(Result.serverError(value))
            }
        } catch {
            DispatchQueue.main.async {
                completionHandler(Result.error(error))
            }
        }
    }
    
    func task<T: Codable> (request: URLRequest, completionHandler: @escaping (Result<T>)->()) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: request) { (responseData, response, error) in
            guard let data = responseData else {
                print("Error: did not receive data")
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(Result.error(error))
                    }
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse  {
                switch httpResponse.statusCode {
                case 200:
                    self.decode(data: data, completionHandler: completionHandler)
                case 204:
                    completionHandler(Result.successNoValue("Delete successful"))
                case 400, 401, 403, 404, 500:
                    self.decocdeServerError(data: data, completionHandler: completionHandler)
                default:
                    break
                }
            }
        }
        return task
    }
}


