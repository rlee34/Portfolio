//
//  ViewController.swift
//  Twittler
//
//  Created by Ryan Lee on 4/15/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "twittlerData", ofType: "txt") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    
                    for user in jsonObj["users"] {
                        let username = user.0
                        let tweets = jsonObj["users"][username].arrayValue.map { $0.stringValue }
                        
                        // append username to users array.
                        users.append(username)
                        // loads existing tweets from txt file (JSON) and assigns them as values for each user.
                        userTweets.updateValue(tweets, forKey: username)
                    }
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

