//
//  SecondViewController.swift
//  Muscle Sandwich
//
//  Created by Berk Abbasoglu on 30/11/2016.
//  Copyright © 2016 Berk Abbasoglu. All rights reserved.
//

import UIKit

class PresetMealPickerViewController: UIViewController {
    
    // properties
    var presetMeals : [Meal] = [Meal]()
    var chosen : Meal = Meal()
    var customMealViewControllerDelegate:CustomMealViewControllerDelegeate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presetMeals = allPresetMeals()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneClicked(_ sender: UIButton) {
        
        if let vcDelegate = customMealViewControllerDelegate {
            vcDelegate.addIngredient(name: chosen.name, macro: chosen.mealMacros)
        }
        
        removeAnimate()
        
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        removeAnimate()
    }
    
    // define preset meals
    func allPresetMeals() -> [Meal] {
        
        var allMeals = [Meal]()
        
        // define some meals
        let lactoseFreeMilk = Meal()
        lactoseFreeMilk.name = "Lactose Free Milk"
        lactoseFreeMilk.serving = 100
        lactoseFreeMilk.mealMacros = Macros(calories: 63, protein: 3, carbs: 5, fat: 3)
        allMeals.append(lactoseFreeMilk)
        
        let strawberry = Meal()
        strawberry.name = "Strawberry"
        strawberry.serving = 100
        strawberry.mealMacros = Macros(calories: 32, protein: 1, carbs: 6, fat: 0)
        allMeals.append(strawberry)
        
        let banana = Meal()
        banana.name = "Banana"
        banana.serving = 100
        banana.mealMacros = Macros(calories: 77, protein: 1, carbs: 18, fat: 0)
        allMeals.append(banana)
        
        return allMeals
        
    }
    
    // animate methods
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    // UI Picker View Delegate Methods
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presetMeals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return presetMeals[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosen = presetMeals[row]
    }
    
}

