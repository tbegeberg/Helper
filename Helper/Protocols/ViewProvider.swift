//
//  File.swift
//  Helper
//
//  Created by TørK on 15/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation

import UIKit

protocol ViewProvider {
    func getViewController() -> UIViewController
}

extension UIViewController:ViewProvider {
    func getViewController() -> UIViewController {
        return self
    }
}
