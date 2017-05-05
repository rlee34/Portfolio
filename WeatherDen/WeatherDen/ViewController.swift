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
        //weatherGetter.getWeatherBy(city: "739 FM 3453 Trintiy, TX")
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("click: \(searchBar.text)")
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

