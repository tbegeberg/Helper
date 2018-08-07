//
//  ProfileController.swift
//  App
//
//  Created by TørK on 29/07/2018.
//

import Foundation
import Vapor


final class UserController: BaseController<User> {

    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(User.self).flatMap { item in
            return item.delete(on: req)
            }.transform(to: .noContent)
        
    }
}
