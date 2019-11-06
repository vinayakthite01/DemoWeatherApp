//
//  Debug.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

class Log {
    
    var intFor : Int
    
    init() {
        intFor = 42
    }
    
    func DLog(message: String, function: String = #function) {
        #if DEBUG
        print("\(function): \(message)")
        #endif
    }
}
