//
//  File.swift
//  Helper
//
//  Created by TørK on 27/07/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

protocol CodableImage {
    func encodeImage(image: UIImage) -> Data
    func decodeImage(data: Data) -> UIImage
}


