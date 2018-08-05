//
//  Result.swift
//  Helper
//
//  Created by TørK on 01/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case successNoValue(String)
    case error(Error)
    case serverError(ServerError)
}
