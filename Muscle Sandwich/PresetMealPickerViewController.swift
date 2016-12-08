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
        
        let chickenBreast = Meal()
        chickenBreast.name = "Chicken Breast"
        chickenBreast.serving = 100
        chickenBreast.mealMacros = Macros(calories: 120, protein: 23, carbs: 0, fat: 3)
        allMeals.append(chickenBreast)
        
        let broccoli = Meal()
        broccoli.name = "Broccoli"
        broccoli.serving = 100
        broccoli.mealMacros = Macros(calories: 26, protein: 3, carbs: 3, fat: 0)
        allMeals.append(broccoli)
        
        let wholeGrainBread = Meal()
        wholeGrainBread.name = "Whole Grain Bread"
        wholeGrainBread.serving = 100
        wholeGrainBread.mealMacros = Macros(calories: 275, protein: 9, carbs: 49, fat: 5)
        allMeals.append(wholeGrainBread)
        
        let goudaCheese = Meal()
        goudaCheese.name = "Gouda Cheese"
        goudaCheese.serving = 100
        goudaCheese.mealMacros = Macros(calories: 353, protein: 27, carbs: 3, fat: 27)
        allMeals.append(goudaCheese)
        
        let goudaCheeseLight = Meal()
        goudaCheeseLight.name = "Light Gouda Cheese"
        goudaCheeseLight.serving = 100
        goudaCheeseLight.mealMacros = Macros(calories: 218, protein: 30, carbs: 2, fat: 10)
        allMeals.append(goudaCheeseLight)
        
        let wasa = Meal()
        wasa.name = "Wasa"
        wasa.serving = 100
        wasa.mealMacros = Macros(calories: 340, protein: 9, carbs: 67, fat: 1)
        allMeals.append(wasa)
        
        let eggWhole = Meal()
        eggWhole.name = "Egg (Whole)"
        eggWhole.serving = 100
        eggWhole.mealMacros = Macros(calories: 154, protein: 13, carbs: 0, fat: 11)
        allMeals.append(eggWhole)
        
        let eggWhite = Meal()
        eggWhite.name = "Egg (White)"
        eggWhite.serving = 100
        eggWhite.mealMacros = Macros(calories: 50, protein: 11, carbs: 0, fat: 0)
        allMeals.append(eggWhite)
        
        let proteinShake = Meal()
        proteinShake.name = "Protein Shake"
        proteinShake.serving = 1
        proteinShake.mealMacros = Macros(calories: 110, protein: 26, carbs: 1, fat: 0)
        allMeals.append(proteinShake)
        
        let raspberry = Meal()
        raspberry.name = "Raspberry"
        raspberry.serving = 100
        raspberry.mealMacros = Macros(calories: 52, protein: 1, carbs: 12, fat: 0)
        allMeals.append(raspberry)
        
        
        return allMeals
        
    }
    
}

