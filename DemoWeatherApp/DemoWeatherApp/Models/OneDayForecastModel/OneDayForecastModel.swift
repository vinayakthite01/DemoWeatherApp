//
//  OneDayForecasteModel.swift
//  DemoWeatherApp
//
//  Created by Vinayak Thite on 07/11/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

struct OneDayForecast {
    
    // MARK: - Constants
    let headlineText : String?
    let headlineCategory : String?
    let TemperatureDict : [String: Any]?
    let minimumTemperatureDict : [String: Any]?
    let minimumTemperature : String?
    let maximumTemperatureDict : [String: Any]?
    let maximumTemperature : String?
    let DayTimeForecaste : [String: Any]?
    let nightTimeForecaste : [String: Any]?
    
    // MARK: - Initializers
    
    /// Designated initializer
    ///
    /// - Parameters:
    ///   - headLine: Headline dictionary
    ///   - dailyForecaste: Forecaste Dictionary
    init(headLine: [String: Any]?, dailyForecaste: [[String: Any]]?) {
        self.headlineText = headLine?["Text"] as? String
        self.headlineCategory = headLine?["Category"] as? String
        
        self.TemperatureDict = dailyForecaste?[0]["Temperature"] as? [String : Any]
        self.minimumTemperatureDict = TemperatureDict?["Minimum"] as? [String: Any]
        self.minimumTemperature = minimumTemperatureDict?["value"] as? String
        self.maximumTemperatureDict = TemperatureDict?["Maximum"] as? [String: Any]
        self.maximumTemperature = maximumTemperatureDict?["value"] as? String
        self.DayTimeForecaste = dailyForecaste?[0]["Day"] as? [String: Any]
        self.nightTimeForecaste = dailyForecaste?[0]["Night"] as? [String: Any]       
        
    }
    
    /// Convenience Init. Accepts json dictionary object as it is
    ///
    /// - Parameter dictionary: json dictionary object
    init(dictionary: [String: Any]) {
        let headlineDict = dictionary["Haedline"] as? [String: Any]
        let dailyForecasts = dictionary["DailyForecasts"] as? [[String : Any]]
        self.init(headLine: headlineDict, dailyForecaste: dailyForecasts )
    }
}
