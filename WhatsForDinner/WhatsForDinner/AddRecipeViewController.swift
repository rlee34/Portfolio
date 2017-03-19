//
//  AddRecipeViewController.swift
//  WhatsForDinner
//
//  Created by Ryan Lee on 3/18/17.
//  Copyright © 2017 Ryan Lee. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    
    @IBAction func addIngredient(_ sender: Any) {
        let vc = UIAlertController(title: nil, message: "Enter an ingredient", preferredStyle: .alert)
        vc.addTextField { (textField) in
            textField.text = "Enter Ingredient"
        }
        vc.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
            print("add clicked")
            let textField = vc.textFields![0] as UITextField
            print(textField.text!)
            
        }))
        present(vc, animated: true)
    }
    
}
