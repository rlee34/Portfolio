//
//  Recipe.swift/Users/ryanlee/Documents/Portfolio/WhatsForDinner/WhatsForDinner/ViewController.swift
//  WhatsForDinner
//
//  Created by Ryan Lee on 3/18/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
    let image: UIImage!
    var ingredientList: [String]
    let description: String
    
    init(image: UIImage, ingredientList: [String], description: String) {
        self.image = image
        self.ingredientList = ingredientList
        self.description = description
    }
}
