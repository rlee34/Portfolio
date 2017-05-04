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
        let requestURL = URL(string: "https://api.darksky.net/forecast/b3a6a5968633f510815f2cc043fdb2d7/37.279518,-121.867905")!
        
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            if let data = data {
                do {
                    let weatherData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                    let weather = Weather(weatherData: weatherData)
                    
                    print("Cloud cover: \(Int(weather.cloudCover * 100))")
                    print("Humidity: \(Int(weather.humidity * 100))")
                    print("Temp: \(weather.temperature)")
                    print("Wind: \(weather.windSpeed)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        dataTask.resume()
        
        
    }
    
    
}
