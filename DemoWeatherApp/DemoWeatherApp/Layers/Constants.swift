//
//  Constants.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

struct WeatherApiConstants {
    
    static let apiKey = "DxQPOrOSD5gqavzjhAr4FmkkzsPhf6ad"
    
}

struct WeatherAppAPIs {
//    GeoPositionSearch APi to get location details from the current location
    static let geoSearchAPI = "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search"
//    AutoComplete search for location
    static let locationSearchAPI = "http://dataservice.accuweather.com/locations/v1/cities/autocomplete"
//    1 Day of Daily Forecasts - It needs location key as input parameter
    static let oneDayOfDailyForecasteAPI = "http://dataservice.accuweather.com/forecasts/v1/daily/1day/"
//    10 Days of Daily Forecasts - It needs location parameter as input parameter
    static let tenDaysOfDailyForecaste = "http://dataservice.accuweather.com/forecasts/v1/daily/10day/"
//    Dummy POST request
    static let dummyPOSTRequest = ""
}

enum HTTPRequest : String {
    case get  = "GET"
    case post = "POST"
    case mime = "application/json"
}

enum PredefinedErrors: Error {
    case clientError
    case serverError
    case mimeError
    case unknownError
}

struct AppError: Error {
    init(errorCode code: Int, errorMessage message:String) {
    }
}

extension Notification.Name {
    static let locationDidChangeNotification = Notification.Name("locationNotification")
}
