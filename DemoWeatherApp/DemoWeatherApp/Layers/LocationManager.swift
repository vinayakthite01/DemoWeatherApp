//
//  Locationmanager.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    /// Location manager instance
    let locationManager = CLLocationManager()
    
    /// Singleton Instance
    static let shared = LocationManager()
    
    //MARK: - Initializer
    
    /// Initializetion
    override init(){
        super.init()
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            
            if self.locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) {
                locationManager.requestAlwaysAuthorization()
                
            }
        }
    }
    
}
