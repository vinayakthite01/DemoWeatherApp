//
//  HomeViewNetWorkCoordinator.swift
//  DemoWeatherApp
//
//  Created by Vinayak Thite on 07/11/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

class HomeViewNetworkCoordinator {
    
    // MARK: Intance Variables
    typealias CompletionBlock = (Bool, Error?) -> Void

    /// LocationManager Instance
    let locationManager = LocationManager()
    
    /// networkManager Instance
    let networkManager = NetworkManager()
    
    /// Today's Forecast Object
    var todaysForeCast : OndeDayForecaste?
    
    // MARK: - Initializer
    
    /// Default initializer
    init() {
        print(locationManager.currentLocation?.coordinate as Any)
    }
    
    // MARK: Instance Methods
    
    /// This function fetches all the weather updates for the current location
    ///
    /// - Parameter completionHandler: completion handler of the task
    func getCurrentLocationUpdates( completionHandler : @escaping CompletionBlock) {
        // Temp hardcoded value
        let locationKey = "204848"
        
        networkManager.getSearchResults(forURL: WeatherAppAPIs.locationSearchAPI, parameters: locationKey) { [weak self] (jsonData, error) in
            if let _error = error {
                print("Error in fetching location data \(_error)")
                let errorObj = AppError(errorCode: 0, errorMessage: "Error in getting data")
                completionHandler(false,errorObj)
            } else {
                if let _jsonData = jsonData as? [String:Any] {
                    
                    let dataModel = OndeDayForecaste(dictionary: _jsonData)
                    self?.todaysForeCast = dataModel
                    completionHandler(true, nil)
                }
            }
        }
    }
    
    /// Returns today's Forecaste headline
    func forecasteHeadlineText() -> String {
        if let _forecaste = todaysForeCast {
        }
    }
}
