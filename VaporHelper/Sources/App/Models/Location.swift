//
//  Location.swift
//  App
//
//  Created by TørK on 27/07/2018.
//

import Foundation

struct Location: HelperContent {
    var id: Int? 
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.id = nil
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
