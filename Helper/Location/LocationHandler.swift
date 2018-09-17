//
//  Location.swift
//  Helper
//
//  Created by TørK on 11/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    static let shared = LocationHandler()
    
    private override init () {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.stopUpdatingLocation()
        }
    }
    

    func getLocation() throws -> CLLocation  {
        guard let location = locationManager.location else {
            throw ErrorLocation.NoLocation
        }
        return location
    }
    
    func getDistance(location: CLLocation) throws -> Double {
        guard let distance = self.locationManager.location?.distance(from: location) else {
            throw ErrorLocation.NoLocation
        }
        return distance
        
    }
    
}
