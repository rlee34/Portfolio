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

//random tweet generator

var opening = ["just", "", "", "", "", "ask me how I", "completely", "nearly", "productively", "efficiently", "last night I", "the president", "that wizard", "a ninja"]
var verbs = ["drank", "drunk", "deployed", "got", "developed", "built", "invented", "experienced", "fought off", "hardened", "enjoyed", "developed", "consumed", "debunked", "drugged", "doped", "made", "wrote", "saw"]
var objects = ["my", "your", "the", "a", "my", "an entire", "this", "that", "the", "the big", "a new form of"]
var nouns = ["cat", "koolaid", "system", "city", "worm", "cloud", "potato", "money", "way of life", "belief system", "security system", "bad decision", "future", "life", "pony", "mind"]
var tags = ["#techlife", "#burningman", "#sf", "but only I know how", "for real", "#sxsw", "ballin'", "#omg", "#yolo", "#magic", "", "", "", ""]


