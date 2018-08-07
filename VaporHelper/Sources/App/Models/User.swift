//
//  Profile.swift
//  App
//
//  Created by TørK on 27/07/2018.
//

import Foundation

struct User: HelperContent {
    var id: Int?
    let userID: UUID = UUID()
    let helperReviews: [Review]?
    let beneficiaryReviews: [Review]?
    let image: Data
    let location: Location
}





