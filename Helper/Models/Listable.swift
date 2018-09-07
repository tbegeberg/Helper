//
//  Listable.swift
//  Helper
//
//  Created by TørK on 04/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

protocol Listable {
    var title: String { get }
    var subtitle: String { get }
    var listID: UUID { get }
}

extension Assignment: Listable {
    var title: String {
        return self.headline
    }
    
    var subtitle: String {
        return self.requirements
    }
    
    var listID: UUID {
        return self.assignmentID
    }
    
    
}
