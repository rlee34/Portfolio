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

func createUser(forUserName name: String) -> User {
    users.append(name)
    return User.init(userName: name, tweets: [])
}

var users: [String] = []
var shawndrost = createUser(forUserName: "shawndrost")
var sharksforcheap = createUser(forUserName: "sharksforcheap")
var mracus = createUser(forUserName: "mracus")
var douglascalhoun = createUser(forUserName: "douglasCalhoun")
