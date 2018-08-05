//
//  Assignments.swift
//  App
//
//  Created by TørK on 28/07/2018.
//

import Foundation

struct Assignment: HelperContent {
    var id: Int?
    let ownerID: UUID
    let assignmentID: UUID
    let location: Location
    let headline: String
    let requirements: String
    let image: Data?

}
