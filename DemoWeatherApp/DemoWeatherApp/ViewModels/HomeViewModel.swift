//
//  HomeViewModel.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation
import CoreLocation

class HomeViewModel {
    // MARK: Instance variables
    
    /// LocationManager Instance
    let locationManager = LocationManager()
    
    /// completion handler block
    typealias CompletionBlock = ([Location]?, Error?) -> Void
    
    // MARK: Initializer
    
    /// Initializer of View Model
    init() {
        print(locationManager.currentLocation?.coordinate as Any)
    }
    
    // MARK: Instance Methods
    
    func getWeatherDataForCurrentLocation(completionhandler: @escaping CompletionBlock) {
        
    }
    
    
}
