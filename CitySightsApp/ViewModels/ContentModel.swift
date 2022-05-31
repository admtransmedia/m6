//
//  ContentModel.swift
//  CitySightsApp
//
//  Created by Sergei Kriukov on 30.05.2022.
//

import Foundation
import CoreLocation
class ContentModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
   override init() {
       super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        
        
      
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if  locationManager.authorizationStatus == .authorizedAlways ||
                locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            
        } else if locationManager.authorizationStatus == .denied {
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first ?? "no location")
        
        locationManager.stopUpdatingLocation()
    }
}
