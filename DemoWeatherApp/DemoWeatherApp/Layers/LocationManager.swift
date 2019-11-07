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
    
    private let log = Log()
    
    /// Location manager instance
    private let locationManager = CLLocationManager()
    
    /// Location instance which contains coordinate values.
    var currentLocation : CLLocation?
    
    //MARK: - Initializer
    
    /// Initializetion
    override init(){
        super.init()

        if CLLocationManager.locationServicesEnabled() {
            
            switch (CLLocationManager.authorizationStatus()) {
                
            case .notDetermined, .restricted, .denied:
                log.DLog(message: "Location services have restricted usage. Please enable them from setting")
                
            case .authorizedAlways, .authorizedWhenInUse:
                log.DLog(message: "Location Authorization successful.")
                getLocationCoordinates()
                
            @unknown default:
                log.DLog(message: "Error in determining the case")
            }
        } else {
            log.DLog(message: "Device not enabled for locationservices")
        }
    }
    
    /// It fetches the current location coordinates and assigns to currentLocation object
    private func getLocationCoordinates () {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        if self.locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) {
            locationManager.requestAlwaysAuthorization()
        } else {
            log.DLog(message: "Error in fetching current location")
        }
    }
    
}
