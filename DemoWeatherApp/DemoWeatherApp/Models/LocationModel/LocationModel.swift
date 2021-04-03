//
//  LocationsModel.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

struct Location {
    // MARK: - Instance variables
    let type: String?
    let Key: String?
    let LocalizedName: String?
    let Rank: String?
    
    // MARK: - Initialization
    
    /// Intitializer
    ///
    /// - Parameter dictionary: It accepts json dictionary as parameter.
    init(dictionary: [String:Any]) {
        self.type = dictionary["Type"] as? String
        self.Key = dictionary["Key"] as? String
        self.LocalizedName = dictionary["LocalizedName"] as? String
        self.Rank = dictionary["Rank"] as? String
    }
}
