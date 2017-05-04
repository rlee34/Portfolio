//
//  WeatherGetter.swift
//  WeatherDen
//
//  Created by Ryan Lee on 5/3/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import Foundation

class WeatherGetter {
    
    private let darkSkyRequestURL = "https://api.darksky.net/forecast/"
    private let darkSkyAPIKey = "b3a6a5968633f510815f2cc043fdb2d7"
    
    func getWeather() {
        let session = URLSession.shared
        let requestURL = URL(string: "https://api.darksky.net/forecast/b3a6a5968633f510815f2cc043fdb2d7/30.9452,95.3755")!
        
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            print("inside dataTask")
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print(jsonObject)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        dataTask.resume()
        
        
    }
    
    
}
