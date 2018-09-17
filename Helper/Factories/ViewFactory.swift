//
//  ViewFactory.swift
//  Helper
//
//  Created by TørK on 17/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

class ViewFactory {
    
    func buildOwnAssignment(assignment: [Assignment], loginCredentials: LoginCredentials) -> UITableViewController {
        let view = AssignmentListController()
        view.assignment = assignment
        let locationHandler = LocationHandler.shared
        do {
            try view.location = locationHandler.getLocation()
        } catch {
            print("Couldn't get location")
        }
        for value in assignment {
            if value.beneficiaryID == loginCredentials.userID {
                view.list.append(value)
                
            }
        }
        return view
    }

    
    
}
