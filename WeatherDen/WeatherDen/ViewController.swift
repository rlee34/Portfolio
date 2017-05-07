//
//  ViewController.swift
//  WeatherDen
//
//  Created by Ryan Lee on 5/3/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherGetterDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var apparentTemperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cloudCoverLabel: UILabel!
    
    
    var searchController: UISearchController!
    var weatherGetter: WeatherGetter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController:  nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
        
        weatherGetter = WeatherGetter(delegate: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let location = searchBar.text else {
            return
        }
        
        weatherGetter.getWeatherBy(location: location)
        searchController.isActive = false
    }

    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            if let city = self.weatherGetter.address?["City"] {
                self.cityLabel.text = city as? String
            }
            
            self.temperatureLabel.text = String(weather.temperature)
            self.apparentTemperatureLabel.text = String("Feels like \(weather.apparentTemperature)")
            self.summaryLabel.text = weather.summaryLabel
            self.windSpeedLabel.text = String("\(weather.windSpeed) mph")
            self.humidityLabel.text = String("\(Int(weather.humidity * 100))%")
            self.cloudCoverLabel.text = String("\(Int(weather.cloudCover * 100))%")
        }
    }
    
    func didNotGetWeather(error: Error) {
        
    }
    


}

