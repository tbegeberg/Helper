//
//  PictureCodable.swift
//  Helper
//
//  Created by TørK on 17/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import UIKit

class PictureHandler: CodableImage {
    
    func encodeImage(image: UIImage) -> Data {
        guard let imagaData = UIImagePNGRepresentation(image) else {
            return Data()
        }
        return imagaData
    }
    
    func decodeImage(data: Data) -> UIImage {
        guard let image = UIImage(named: "profile") else {
            return UIImage()
        }
        return image
    }
    
}
