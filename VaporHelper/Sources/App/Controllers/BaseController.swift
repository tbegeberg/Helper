//
//  BaseController.swift
//  App
//
//  Created by TørK on 01/08/2018.
//

import Foundation
import Vapor

class BaseController<T: HelperContent> {
    
    func index(_ req: Request) throws -> Future<[T]> {
        return T.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<T> {
        return try req.content.decode(T.self).flatMap { item in
            return item.save(on: req)
        }
    }
    
    func patch(_ req: Request) throws -> Future<T> {
        return try req.content.decode(T.self).flatMap { item in
            return item.update(on: req)
        }
    }
    
}
