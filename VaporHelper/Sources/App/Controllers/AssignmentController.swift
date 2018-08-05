//
//  AssignmentController.swift
//  App
//
//  Created by TørK on 01/08/2018.
//

import Foundation
import Vapor

final class AssignmentController: BaseController<Assignment> {
    
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Assignment.self).flatMap { item in
            return item.delete(on: req)
            }.transform(to: .noContent)
        
    }
}
