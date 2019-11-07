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
    
    /// TypeAliases
    typealias weatherCompletionBlock = (OneDayForecast?, Error?) -> Void
    typealias locationCompletionBlock = (Location?, Error?) -> Void

    /// LocationManager Instance
    let locationManager = LocationManager()
    
    /// networkManager Instance
    let networkManager = NetworkManager()
    
    // MARK: - Initializer
    
    /// Default initializer
    init() {
        print("Current location: \(locationManager.currentLocation?.coordinate as Any)")
    }
    
    // MARK: Instance Methods
    
    func fetchCurrentLocationDetails(withCoordinates coordinates: [String], completionHandler: @escaping locationCompletionBlock) {
        let formattedCoordinates = (coordinates.map{String($0)}).joined(separator: ",")
        guard let urlReuest = URL(string: WeatherAppAPIs.geoSearchAPI+"?apikey="+WeatherApiConstants.apiKey+"&q="+formattedCoordinates) else {
            return completionHandler(nil, PredefinedErrors.unknownError)
        }
        
        networkManager.getSearchResults(forURL:urlReuest) { (jsonData, error) in
            if let _error = error {
                print("Error in fetching location data \(_error)")
                let errorObj = AppError(errorCode: 0, errorMessage: "Error in fetching location data")
                completionHandler(nil,errorObj)
            } else {
                if let _jsonData = jsonData as? [String:Any] {
                    let dataModel = Location(dictionary: _jsonData)
                    completionHandler(dataModel, nil)
                }
            }
        }
        
    }
    
    /// This function fetches all the weather updates for the current location
    ///
    /// - Parameter completionHandler: completion handler of the task
    func getCurrentLocationUpdates(withLocationKey locationKey: String, completionHandler: @escaping weatherCompletionBlock) {
        
        guard let url = URL(string: WeatherAppAPIs.oneDayOfDailyForecasteAPI+locationKey+"?apikey="+WeatherApiConstants.apiKey) else {
            return completionHandler(nil, PredefinedErrors.unknownError)
        }
        
        networkManager.getSearchResults(forURL: url) { (jsonData, error) in
            if let _error = error {
                print("Error in fetching weather data \(_error)")
                let errorObj = AppError(errorCode: 0, errorMessage: "Error in fetching weather data")
                completionHandler(nil,errorObj)
            } else {
                if let _jsonData = jsonData as? [String:Any] {
                    let dataModel = OneDayForecast(dictionary: _jsonData)
                    completionHandler(dataModel, nil)
                }
            }
        }
    }
}
