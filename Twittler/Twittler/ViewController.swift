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
                        let userTweets = jsonObj["users"][username].arrayValue.map { $0.stringValue }
                        
                        users.append(username)
            
                        for tweet in userTweets {
                            let date = Date()
                            let formatter = DateFormatter()
                            formatter.dateFormat = "MM-dd-yyyy h:mm"
                            let tweet = Tweet(user: username, message: tweet, createdAt: formatter.string(from: date))
                            tweets.append(tweet)
                        }
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

        scheduleNextTweet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TweetCell
        
        var tweet: Tweet
        tweet = tweets[indexPath.row]
        cell.usernameLabel?.text = tweet.user
        cell.messageLabel?.text = tweet.message
        cell.timeLabel?.text = tweet.createdAt
        
        return cell
    }
    
    func scheduleNextTweet() {
        let tweet = generateRandomTweet()
        tweets.append(tweet)
        tableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.scheduleNextTweet()
        }
    }
}

