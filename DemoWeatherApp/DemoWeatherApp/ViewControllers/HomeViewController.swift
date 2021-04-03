//
//  ViewController.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var weatherHeadingLabel: UILabel!
    @IBOutlet weak var headLineCategoryLabel: UILabel!
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    
    // MARK: - Instance Variable
    
    /// HomeViewModel
    let homeViewModel = HomeViewModel()

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        NotificationCenter.default.addObserver(self, selector: #selector(locationAuthorizationStatusUpdated(note:)), name: .locationDidChangeNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          refreshWeatherReports()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Remove observers if there are any
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Instance methods
    
    /// This function updates the weather data whenever the location status is changed from denied /notDetermined /restricted to authorizedWhenInUse /authorizedAlways.
    ///
    /// - Parameter note: notification data
    @objc func locationAuthorizationStatusUpdated(note: NSNotification) {
        refreshWeatherReports()
    }
    
    
    func refreshWeatherReports() {
        homeViewModel.fetchLocationDataForCurrentGeoCoordinates {[weak self] (executionStatus, optionalError) in
            if let _error = optionalError  {
                self?.clearUpData()
                let okHandler = {}
                AlertView.sharedInstance.showAlertView(title: "" , message: "Error in retrieving location data. Please try after some time", actions: [okHandler], titles: ["Ok"], actionStyle: UIAlertController.Style.alert)
                self?.weatherHeadingLabel.text = _error.localizedDescription
            } else {
                // Start updating Weather data for the specified location
                self?.homeViewModel.getWeatherDataForCurrentLocation { (executionStatus, error) in
                    if executionStatus == true {
                        print("Weather Data successfully fetched")
                        self?.decorateUI()
                    } else {
                        let okHandler = {}
                        AlertView.sharedInstance.showAlertView(title: "" , message: "Error in fetching weather data for your location. Please try after some time", actions: [okHandler], titles: ["Ok"], actionStyle: UIAlertController.Style.alert)
                        self?.weatherHeadingLabel.text = error?.localizedDescription
                    }
                }
            }
        }
    }
    
    /// This function is used to update the UI component data.
    func decorateUI() {
        if let headlineText = homeViewModel.forecastHeadlineText() {
            weatherHeadingLabel.text = "Today's Forecast :"+"\n"+headlineText
        }
        if let headlineCategory = homeViewModel.forecastHeadingCategory() {
            headLineCategoryLabel.text = headlineCategory
        }
        if let maximumTemperature = homeViewModel.forecastMaximumTemperature() {
            maximumTemperatureLabel.text = "\tMaximum Temperature: "+maximumTemperature
        }
        if let minimumTemperature = homeViewModel.forecastMinimumTemperature() {
            minimumTemperatureLabel.text = "\tMinimum temperature: "+minimumTemperature
        }
    }
    
    /// This function clears the data already present on the screenif there is any error.
    func clearUpData () {
        headLineCategoryLabel.text = ""
        maximumTemperatureLabel.text = ""
        minimumTemperatureLabel.text = ""
    }

}

