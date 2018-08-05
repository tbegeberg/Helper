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
        let location = Location(latitude: 40.22, longitude: 100.2)
        

        let profile = Profile(helperReviews: nil, beneficiaryReviews: nil, image: image, location: location)
        //self.postProfiles(profile: profile)
        //self.getProfiles()
        self.deleteProfile(id: 18)
        
    }
    
    func postProfiles(profile: Profile) {
        NetworkHandler.shared.post(post: profile, url: "http://localhost:8080/postProfile") { (result:Result<Profile>) in
            switch result {
            case .success(let value):
                print(value)
            case .error(let error):
                print(error)
            case .serverError(let error):
                print(error)
            case .successNoValue(_):
                print("No value")
            }
        }
    }
    
    func getProfiles() {
        NetworkHandler.shared.get(url: "http://localhost:8080/getProfile") { (result:Result<[Profile]>) in
            switch result {
            case .success(let value):
                print(value)
            case .error(let error):
                print(error)
            case .serverError(let error):
                print(error)
            case .successNoValue(_):
                print("No value")
            }
            
        }
    }
    
    func deleteProfile(id: Int) {
        NetworkHandler.shared.delete(url: "http://localhost:8080/deleteProfile/\(id)") { (result:Result<Profile>) in
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

