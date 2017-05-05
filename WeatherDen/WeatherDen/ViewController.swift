//
//  ViewController.swift
//  WeatherDen
//
//  Created by Ryan Lee on 5/3/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherGetterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherGetter = WeatherGetter(delegate: self)
        weatherGetter.getWeatherBy(city: "Houston, TX")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didGetWeather() {
        
    }
    
    func didNotGetWeather() {
        
    }
    


}

