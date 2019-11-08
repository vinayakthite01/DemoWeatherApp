//
//  Locationmanager.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationManager: NSObject {
    
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
            getLocationAccess()
            switch (CLLocationManager.authorizationStatus()) {
                
            case .notDetermined, .restricted, .denied:
                log.DLog(message: "Location services have restricted usage. Please enable them from setting")
                
            case .authorizedAlways, .authorizedWhenInUse:
                NotificationCenter.default.post(name: .locationDidChangeNotification, object: nil)
                log.DLog(message: "Location Authorization successful.")
                
            @unknown default:
                log.DLog(message: "Error in determining the case for location sharing")
            }
        } else {
            log.DLog(message: "Device not enabled for locationservices")
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    /// It fetches the current location coordinates and assigns to currentLocation object
    private func getLocationAccess () {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        currentLocation = locationManager.location
        
        if self.locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) {
            locationManager.requestAlwaysAuthorization()
        } else {
            log.DLog(message: "Error in fetching current location")
        }
    }
    
    /// This delegate method is called whenever there is change in location authorization status.
    ///
    /// - Parameters:
    ///   - manager: location manager
    ///   - status: aurthorization status
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .denied || status == .notDetermined || status == .restricted ) {
            // The user denied authorization
            let okHandler = {}
            AlertView.sharedInstance.showAlertView(title: "" , message: "Location authorization status changed to restricted.", actions: [okHandler], titles: ["Ok"], actionStyle: UIAlertController.Style.alert)
            print("Location authorization status changed to restricted.")
        } else if (status == .authorizedAlways || status == .authorizedWhenInUse) {
            // The user accepted authorization
             NotificationCenter.default.post(name: .locationDidChangeNotification, object: nil)
            print("Location authorization status changed to allow always.")
        }
    }

}
