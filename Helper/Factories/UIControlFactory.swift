//
//  File.swift
//  Helper
//
//  Created by TørK on 23/08/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

class UIControlFactory {
    
    public func buildButton(title: String) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 20)
        button.backgroundColor = UIColor(red: 14/255, green: 122/255, blue: 254/255, alpha: 1.0)
        button.sizeToFit()
        return button
    }
    
}
