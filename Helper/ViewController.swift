//
//  ViewController.swift
//  Helper
//
//  Created by TørK on 25/07/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CodableImage {
    func encodeImage(image: UIImage) -> Data {
        let imagaData = UIImagePNGRepresentation(image)
        return imagaData!
    }

    func decodeImage(data: Data) -> UIImage {
        let image = UIImage(named: "profile")
        return image!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pic = UIImage(named: "profile")
        let image = self.encodeImage(image: pic!)
        let location = Location(id: nil, latitude: 40.22, longitude: 20.2)
        
        let user = User(id: nil, username: "Peter", password: "Password", userID: UUID())
        let assignment = Assignment(id: nil, beneficiaryID: UUID(), assignmentID: UUID(), location: location, headline: "NEED HELP", requirements: "TOOLS", image: nil)
        
        user.createUser(model: user) { (result: Result<User.PublicUser>) in
            switch result {
            case .success(let value):
                print(value)
            case .error(let error):
                print(error)
            case .serverError(let error):
                print(error)
            case .successNoValue(let value):
                print(value)
            }
        }
   

        
        /*
         user.createUser(model: user) { (result: Result<User.PublicUser>) in
         switch result {
         case .success(let value):
         print(value)
         case .error(let error):
         print(error)
         case .serverError(let error):
         print(error)
         case .successNoValue(let value):
         print(value)
         }
         }
         
        profile.patch(model: profile) { (result:Result<User>) in
            switch result {
            case .success(let value):
                print(value)
            case .error(let error):
                print(error)
            case .serverError(let error):
                print(error)
            case .successNoValue(let value):
                print(value)
            }
        }
        
        
        profile.get { (result:Result<[User]>) in
            switch result {
            case .success(let value):
                print(value)
            case .error(let error):
                print(error)
            case .serverError(let error):
                print(error)
            case .successNoValue(let value):
                print(value)
            }
        }
        */
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

