//
//  NetworkError.swift
//  Helper
//
//  Created by TørK on 01/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

enum NetworkError: LocalizedError {
    case missing(String)
    case urlError(reason: String)
    case objectSerialization(reason: String)
}
