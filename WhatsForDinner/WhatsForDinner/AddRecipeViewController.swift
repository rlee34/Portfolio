//
//  AddRecipeViewController.swift
//  WhatsForDinner
//
//  Created by Ryan Lee on 3/18/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    @IBOutlet weak var addIngredientModal: UIView!
    
    @IBAction func addIngredient(_ sender: Any) {
        
        addIngredientModal.isHidden = false

    }
    
    @IBAction func finishedInputtingIngredients(_ sender: Any) {
        addIngredientModal.isHidden = true
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addIngredientModal.isHidden = true
    }
}
