//
//  Location.swift
//  Helper
//
//  Created by TørK on 11/09/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHandler {
    
    let locationManager = CLLocationManager()
    
    func setupLocationManager(delegate: CLLocationManagerDelegate) {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = delegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    
    func getLocation() -> Location {
        
        
        let location = Location(id: nil, latitude: 1, longitude: 1)
        return location
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
    }
}
