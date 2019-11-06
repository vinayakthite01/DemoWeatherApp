//
//  NetworkLayer.swift
//  DemoWeatherApp
//
//  Created by Vinayak_Thite on 11/6/19.
//  Copyright © 2019 Vinayak_Thite. All rights reserved.
//

import Foundation

class NetworkManager  {
    
    // MARK: Instance Variables
    
    /// Logger
    private let logFor = Log()
    
    /// Locations array
    var locations : [Location] = []
    
    // MARK: - Type Aliases
    typealias JSONDictionary = [String: Any]
    typealias CompletionBlock = ([Location]?, Error?) -> Void
    
    /// Singleton Instance
    static let shared = NetworkManager()
    
    //MARK: - Initializer
    
    /// Initializetion
    init(){}
    
    //MARK: - Instance Methods
    
    /// Function to call GET request
    ///
    /// - Parameters:
    ///   - url: URL to hit
    ///   - keyword: as parameters for the URL
    ///   - completion: completionhandler
    func getSearchResults(forURL url: String, parameters keyword: String, completion: @escaping CompletionBlock) {
        
        let session = URLSession.shared
        guard let url = URL(string: url) else {
            return completion(nil, AppError.unknownError)
        }
        
        let task = session.dataTask(with: url) {[weak self] data, response, error in
            
            if error != nil || data == nil {
                self?.logFor.DLog(message:"Client error!")
                DispatchQueue.main.async {
                    completion(nil, AppError.clientError)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                 self?.logFor.DLog(message:"Server error!")
                DispatchQueue.main.async {
                    completion(nil, AppError.serverError)
                }
                return
            }
            
            guard let mime = response.mimeType, mime == HTTPRequest.mime.rawValue else {
                 self?.logFor.DLog(message:"Wrong MIME type!")
                DispatchQueue.main.async {
                    completion(nil, AppError.mimeError)
                }
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                self?.logFor.DLog(message:"The Response is :\(json) ")
                
                DispatchQueue.main.async {
                    completion(self?.locations, nil)
                }
                
            } catch {
                 self?.logFor.DLog(message:"JSON error: \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
    
    // TODO: Create Generic POST request method
//    func postRequest(){
//        var session = URLSession.shared
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 30
//        configuration.timeoutIntervalForResource = 30
//        session = URLSession(configuration: configuration)
//
//        let url = URL(string: WeatherAppAPIs.dummyPOSTRequest)!
//
//        var request = URLRequest(url: url)
//        request.httpMethod = HTTPRequest.post.rawValue
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        let parameters = ["username": "foo", "password": "123456"]
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        } catch let error {
//            print(error.localizedDescription)
//        }
//
//        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//
//            if error != nil || data == nil {
//                print("Client error!")
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                print("Oops!! there is server error!")
//                return
//            }
//
//            guard let mime = response.mimeType, mime == "application/json" else {
//                print("response is not json")
//                return
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                print("The Response is : ",json)
//            } catch {
//                print("JSON error: \(error.localizedDescription)")
//            }
//
//        })
//
//        task.resume()
//    }
}