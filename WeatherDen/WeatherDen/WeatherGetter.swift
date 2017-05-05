//
//  WeatherGetter.swift
//  WeatherDen
//
//  Created by Ryan Lee on 5/3/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import CoreLocation
import Foundation

protocol WeatherGetterDelegate {
    func didGetWeather(weather: Weather)
    func didNotGetWeather(error: Error)
}

class WeatherGetter {
    
    private let darkSkyRequestURL = "https://api.darksky.net/forecast/"
    private let darkSkyAPIKey = "b3a6a5968633f510815f2cc043fdb2d7"
    
    var geocoder = CLGeocoder()
    var delegate: WeatherGetterDelegate
    
    init(delegate: WeatherGetterDelegate) {
        self.delegate = delegate
    }

    func getWeatherBy(city: String) {

        geocoder.geocodeAddressString(city) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                let coords = location.coordinate
                let lat = coords.latitude
                let long = coords.longitude
                let requestURL = URL(string: "\(self.darkSkyRequestURL)\(self.darkSkyAPIKey)/\(lat),\(long)")!
                self.getWeatherBy(url: requestURL)
            }
        }
    }
    
    func getWeatherBy(url: URL) {
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let weatherData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                    let weather = Weather(weatherData: weatherData)
                    
                    self.delegate.didGetWeather(weather: weather)
                    print("Cloud cover: \(Int(weather.cloudCover * 100))")
                    print("Humidity: \(Int(weather.humidity * 100))")
                    print("Temp: \(weather.temperature)")
                    print("Wind: \(weather.windSpeed)")
                } catch {
                    self.delegate.didNotGetWeather(error: error)
                }
            }
        }
        
        dataTask.resume()
    }
    
//    func getCoordsFrom(city: String) {
//        var lat: Float
//        var long: String
//        
//        geocoder.geocodeAddressString(city) { placemarks, error in
//            if let placemark = placemarks?.first {
//                let location = placemark.location
//                let coords = location?.coordinate
//                lat = Float(coords?.latitude)
//                long = coords?.longitude
//                
//            }
//        }
//        print(String(describing: lat))
//                print(long ?? "error")
//    }
    
    
}
