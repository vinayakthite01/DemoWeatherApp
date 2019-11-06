//
//  HomeViewModel.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

class HomeViewModel {
    // MARK: Instance variables
    
    /// LocationManager Instance
    let locationmanager = LocationManager()
    
    /// completion handler block
    typealias CompletionBlock = ([Location]?, Error?) -> Void
    
    // MARK: Initializer
    
    /// Initializer of View Model
    init() {
        
    }
    
    // MARK: Instance Methods
    
    
    
}
