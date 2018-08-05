//
//  ServerError.swift
//  Helper
//
//  Created by TørK on 01/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

struct ServerError: Codable {
    var reason: String
    var error: Bool
}

