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

var users: [String] = []
var tweets: [Tweet] = []

//random tweet generator
var opening = ["just", "", "", "", "", "ask me how I", "completely", "nearly", "productively", "efficiently", "last night I", "the president", "that wizard", "a ninja"]
var verbs = ["drank", "drunk", "deployed", "got", "developed", "built", "invented", "experienced", "fought off", "hardened", "enjoyed", "developed", "consumed", "debunked", "drugged", "doped", "made", "wrote", "saw"]
var objects = ["my", "your", "the", "a", "my", "an entire", "this", "that", "the", "the big", "a new form of"]
var nouns = ["cat", "koolaid", "system", "city", "worm", "cloud", "potato", "money", "way of life", "belief system", "security system", "bad decision", "future", "life", "pony", "mind"]
var tags = ["#techlife", "#burningman", "#sf", "but only I know how", "for real", "#sxsw", "ballin'", "#omg", "#yolo", "#magic", "", "", "", ""]

func randomMessage() -> String {
    return [randomElement(fromArray: opening), randomElement(fromArray: verbs), randomElement(fromArray: objects), randomElement(fromArray: nouns), randomElement(fromArray: tags)].joined(separator: " ")
}

//helper functions
func randomElement(fromArray array: [String]) -> String {
    let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
    let result = array[randomIndex]
    return result
}

