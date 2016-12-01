//
//  SecondViewController.swift
//  Muscle Sandwich
//
//  Created by Berk Abbasoglu on 30/11/2016.
//  Copyright © 2016 Berk Abbasoglu. All rights reserved.
//

import UIKit

protocol PresetMealViewControllerDelegate {
    
    func setCustomMealName(meal : Meal)
    
}

class PresetMealViewController: UIViewController, PresetMealViewControllerDelegate {
    
    // properties
    @IBOutlet weak var meal1Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PresetMealViewController.meal1Tapped(gestureRecognizer:)))
        meal1Label.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // gesture recogniser for meal
    func meal1Tapped(gestureRecognizer: UITapGestureRecognizer) {
        
        let popUpCustomMeal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "customMeal") as! CustomMealViewController
        popUpCustomMeal.presetMealViewControllerDelegate = self
        self.addChildViewController(popUpCustomMeal)
        popUpCustomMeal.view.frame = self.view.frame
        self.view.addSubview(popUpCustomMeal.view)
        popUpCustomMeal.didMove(toParentViewController: self)
        
    }
    
    func setCustomMealName(meal: Meal) {
        
        meal1Label.text = meal.name
        
    }
}

