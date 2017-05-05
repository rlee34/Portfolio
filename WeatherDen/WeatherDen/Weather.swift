//
//  Weather.swift
//  WeatherDen
//
//  Created by Ryan Lee on 5/3/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import Foundation

struct Weather {
    let city = ""
    let temperature: Int
    let cloudCover: Double
    let humidity: Double
    let windSpeed: Int
    
    init(weatherData: [String: AnyObject]) {
        let currentWeatherDict = weatherData["currently"] as! [String: AnyObject]
        self.temperature = currentWeatherDict["temperature"] as! Int
        self.cloudCover = currentWeatherDict["cloudCover"] as! Double
        self.humidity = currentWeatherDict["humidity"] as! Double
        self.windSpeed = currentWeatherDict["windSpeed"] as! Int
    }
}
