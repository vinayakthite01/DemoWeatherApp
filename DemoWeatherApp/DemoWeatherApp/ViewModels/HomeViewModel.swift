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
    
    /// Current Location model
    var currentLocationDetails : Location?
    
    /// Today's Forecast Object
    var todaysForeCast : OneDayForecast?
    
    /// completion handler block
    typealias CompletionBlock = (Bool, Error?) -> Void
    
    // MARK: Initializer
    
    /// Initializer of View Model
    init() {
        
        fetchLocationDataForCurrentGeoCoordinates {[weak self] (executionStatus, optionalError) in
            if executionStatus == true {
                self?.getWeatherDataForCurrentLocation { (executionStatus, error) in
                    if executionStatus == true {
                        print("Weather Data successfully fetched")
                    } else {
                        print("Error\(String(describing: error))")
                    }
                }
            } else {
                print("Error in Location fetch. Weather data cannot be updated at this time")
            }
        }
    }
    
    // MARK: Instance Methods
    
    /// This function fetches location Updates
    ///
    /// - Parameter completionhandler: completion handler of the task.
    func fetchLocationDataForCurrentGeoCoordinates(completionhandler: @escaping CompletionBlock) {
        guard let _currentLocation = locationManager.currentLocation else {
            return
        }
        let lattitude = String(format:"%f",  _currentLocation.coordinate.latitude)
        let longitude = String(format:"%f",  _currentLocation.coordinate.longitude)
        let currentlocationCoordinates = [lattitude, longitude]
        homeViewNetworkCoordinator.fetchCurrentLocationDetails(withCoordinates: currentlocationCoordinates) { [weak self] (optionalLocationDetails, optionalError) in
            if let error = optionalError {
                print("Error in fetching the location details")
                completionhandler(false, error)
            } else {
                self?.currentLocationDetails = optionalLocationDetails
                completionhandler(true, nil)
            }
        }
    }
    
    /// Get weather data for current location
    ///
    /// - Parameter completionhandler: completion handler for the task
    func getWeatherDataForCurrentLocation(completionhandler: @escaping CompletionBlock) {
        if let locationKey = currentLocationDetails?.Key {
            homeViewNetworkCoordinator.getCurrentLocationUpdates(withLocationKey: locationKey) {[weak self]
                (optionalData, optionalError) in
                if let error = optionalError {
                    print("Error in HomeViewModel \(error)")
                    completionhandler(false, error)
                } else {
                    self?.todaysForeCast = optionalData
                    completionhandler(true, nil)
                }
            }
        }
    }
    
    
    /// This function is used for getting today's Forecast headling text
    ///
    /// - Returns: Headline for the forcast
    func forecastHeadlineText() -> String? {
        if let _forecast = todaysForeCast {
            return _forecast.headlineText
        }
        return nil
    }
    
    /// This function is used for getting today's forecast heading category
    ///
    /// - Returns: Category of the headline
    func forecastHeadingCategory() -> String? {
        if let _forecast = todaysForeCast {
            return _forecast.headlineCategory
        }
        return nil
    }
    
    
    /// This function is used for getting today's maximum temperature forecast
    ///
    /// - Returns: today's maximum temperature forecast
    func forecastMaximumTemperature() -> String? {
        if let _forecast = todaysForeCast {
            return _forecast.maximumTemperature
        }
        return nil
    }
    
    /// This function is used for getting today's minimum temperature forecast
    ///
    /// - Returns: today's minimum temperature forecast
    func forecastMinimumTemperature() -> String? {
        if let _forecast = todaysForeCast {
            return _forecast.minimumTemperature
        }
        return nil
    }
}
