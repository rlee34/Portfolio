//
//  dataGenerator.swift
//  Twittler
//
//  Created by Ryan Lee on 4/15/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import Foundation

struct Tweet {
    let user: String
    var message: String
    let createdAt: String
}

struct User {
    let userName: String
    var tweets: [String]
}

func createUser(forUserName name: String) {
    users.append(name)
    tweets.append(User.init(userName: name, tweets: ["a tweet"]))
}

var users: [String] = []
var tweets: [User] = []
