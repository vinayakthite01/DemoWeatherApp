//
//  LocationsModel.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

struct Location {
    // MARK: - Constants
    let type: String
    let Key: Int
    let LocalizedName: String
    let Rank: Int
    
    // MARK: - Variables And Properties
    var downloaded = false
    
    // MARK: - Initialization
    init(name: String, type: String, key: Int, rank: Int) {
        self.LocalizedName = name
        self.type = type
        self.Key = key
        self.Rank = rank
    }
}
