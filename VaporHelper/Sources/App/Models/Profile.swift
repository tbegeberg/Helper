//
//  Profile.swift
//  App
//
//  Created by TørK on 27/07/2018.
//

import Foundation

struct Profile: HelperContent {
    var id: Int? 
    let profileID: UUID
    let helperReviews: [Review]?
    let beneficiaryReviews: [Review]?
    let image: Data
    let location: Location

    init(helperReviews: [Review]?, beneficiaryReviews: [Review]?, image: Data, location: Location ) {
        self.id = nil
        self.profileID = UUID()
        self.helperReviews = helperReviews
        self.beneficiaryReviews = beneficiaryReviews
        self.image = image
        self.location = location
    }


    
}





