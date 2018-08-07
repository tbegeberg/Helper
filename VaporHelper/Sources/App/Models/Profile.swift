//
//  Profile.swift
//  App
//
//  Created by TørK on 27/07/2018.
//

import Foundation

struct Profile: HelperContent {
    var id: Int?
    let profileID: UUID = UUID()
    let helperReviews: [Review]?
    let beneficiaryReviews: [Review]?
    let image: Data
    let location: Location
}




 
