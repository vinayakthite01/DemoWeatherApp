//
//  Constants.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

struct WeatherAppConstants {
    
    static let apiKey = "2O5deGNXGBrjt6zXDFtUZnA91EYQgGG0"
    
}

struct WeatherAppAPIs {
    
    static let locationSearchAPI = "http://dataservice.accuweather.com/locations/v1/cities/autocomplete"
    static let dummyPOSTRequest = ""
}

enum HTTPRequest : String {
    case get  = "GET"
    case post = "POST"
    case mime = "application/json"
}

enum AppError: Error {
    case clientError
    case serverError
    case mimeError
    case unknownError
}
