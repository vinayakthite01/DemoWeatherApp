//
//  CitySearchViewModel.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

class CitySearchViewModel {
    
    typealias CompletionBlock = ([Location]?, Error?) -> Void
    
    /// Initializer of View Model
    init() {
    }
    
    /// This function searches the cities those are similar to the string entered by the user
    ///
    /// - Parameters:
    ///   - string: <#string description#>
    ///   - completionHandler: <#completionHandler description#>
    func searchCities(forString string: String, completionHandler: @escaping CompletionBlock) {
        
    }
    
}
