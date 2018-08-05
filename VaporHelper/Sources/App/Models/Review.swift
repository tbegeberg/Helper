//
//  Review.swift
//  App
//
//  Created by TørK on 27/07/2018.
//

import Foundation

struct Review: HelperContent {
    var id: Int? 
    let helperID: UUID
    let beneficiaryID: UUID
    let rating: Int
    let text: String
}
