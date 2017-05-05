//
//  ViewController.swift
//  WeatherDen
//
//  Created by Ryan Lee on 5/3/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherGetterDelegate {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    var weatherGetter: WeatherGetter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherGetter = WeatherGetter(delegate: self)
        weatherGetter.getWeatherBy(city: "739 FM 3453 Trintiy, TX")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = String(weather.temperature)
            
            if let city = self.weatherGetter.address?["City"] {
                self.cityLabel.text = city as? String
            }
        }
    }
    
    func didNotGetWeather(error: Error) {
        
    }
    


}

