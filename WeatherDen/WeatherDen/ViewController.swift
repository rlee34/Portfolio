//
//  ViewController.swift
//  WeatherDen
//
//  Created by Ryan Lee on 5/3/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherGetter = WeatherGetter()
        weatherGetter.getWeatherBy(city: "Tampa, FL")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

