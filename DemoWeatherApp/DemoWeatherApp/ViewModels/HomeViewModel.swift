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
    let homeViewNetworkCoordinator = HomeViewNetworkCoordinator()
    
    /// LocationManager Instance
    let locationManager = LocationManager()
    
    /// completion handler block
    typealias CompletionBlock = ([Location]?, Error?) -> Void
    
    // MARK: Initializer
    
    /// Initializer of View Model
    init() {
        
    }
    
    // MARK: Instance Methods
    
    /// Get weather datafor current location
    ///
    /// - Parameter completionhandler: completion handler for the task
    func getWeatherDataForCurrentLocation(completionhandler: @escaping CompletionBlock) {
        homeViewNetworkCoordinator.getCurrentLocationUpdates(completionHandler: <#(Any?, Error?) -> Void#>)
    }
    
    
}
