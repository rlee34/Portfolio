//
//  dataGenerator.swift
//  Twittler
//
//  Created by Ryan Lee on 4/15/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import Foundation

var users: [String] = []
var userTweets: [String: [String]] = [:]

struct Tweet {
    let user: String
    var message: String
    let createdAt: String
}

struct User {
    let userName: String
    var tweets: [String]
}


