//
//  SecondViewController.swift
//  Muscle Sandwich
//
//  Created by Berk Abbasoglu on 30/11/2016.
//  Copyright © 2016 Berk Abbasoglu. All rights reserved.
//

import UIKit

protocol CustomMealViewControllerDelegeate {
    
    func addIngredient(name : String, macro : Macros)
    
}

class CustomMealViewController: UIViewController, CustomMealViewControllerDelegeate {
    
    // final variables
    @IBOutlet weak var finalFoodNameTextField: UITextField!
    @IBOutlet weak var finalServingTextField: UITextField!
    @IBOutlet weak var finalCaloriesTextField: UITextField!
    @IBOutlet weak var finalProteinTextField: UITextField!
    @IBOutlet weak var finalCarbsTextField: UITextField!
    @IBOutlet weak var finalFatTextField: UITextField!
    
    
    // other variables
    @IBOutlet weak var foodNameTextField1: UITextField!
    @IBOutlet weak var caloriesTextField1: UITextField!
    @IBOutlet weak var proteinTextField1: UITextField!
    @IBOutlet weak var carbsTextField1: UITextField!
    @IBOutlet weak var fatTextField1: UITextField!
    
    // buttons
    @IBOutlet weak var choosePreset1: UIButton!
    var preset1NotChosen = true
    
    var presetMealViewControllerDelegate:PresetMealViewControllerDelegate?
    var finalMeal = Meal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // set final values for calories, protein, carbs, and fat
        calculateFinalValues()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choosePresetClicked(_ sender: UIButton) {
        
        if preset1NotChosen {
            
            // since this is preset, user interaction for relavant fields must not be enabled
            foodNameTextField1.isUserInteractionEnabled = false
            caloriesTextField1.isUserInteractionEnabled = false
            proteinTextField1.isUserInteractionEnabled = false
            carbsTextField1.isUserInteractionEnabled = false
            fatTextField1.isUserInteractionEnabled = false
        
            // show preset meal vc
            let popUpPreset = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "presetMeal") as! PresetMealPickerViewController
            popUpPreset.customMealViewControllerDelegate = self
            self.addChildViewController(popUpPreset)
            popUpPreset.view.frame = self.view.frame
            self.view.addSubview(popUpPreset.view)
            popUpPreset.didMove(toParentViewController: self)
        
            choosePreset1.setTitle("Empty", for: .normal)
            
            preset1NotChosen = false
        }
        
        else {
            
            // since this is no longer preset, user interaction for relavant fields must be enabled
            foodNameTextField1.isUserInteractionEnabled = true
            caloriesTextField1.isUserInteractionEnabled = true
            proteinTextField1.isUserInteractionEnabled = true
            carbsTextField1.isUserInteractionEnabled = true
            fatTextField1.isUserInteractionEnabled = true
            
            
            // clear the relavant fields
            foodNameTextField1.text = ""
            caloriesTextField1.text = ""
            proteinTextField1.text = ""
            carbsTextField1.text = ""
            fatTextField1.text = ""
            
            choosePreset1.setTitle("Choose Preset", for: .normal)
            
            // recalculate final values
            calculateFinalValues()
            
            preset1NotChosen = true
            
        }
    }
    
    // protocol methods
    func addIngredient(name : String, macro : Macros) {
        
        foodNameTextField1.text = name
        caloriesTextField1.text = String(macro.calories)
        proteinTextField1.text = String(macro.protein)
        carbsTextField1.text = String(macro.carbs)
        fatTextField1.text = String(macro.fat)
        
        // update final values
        calculateFinalValues()
        
    }
    
    func calculateFinalValues() {
        
        finalCaloriesTextField.text = caloriesTextField1.text
        finalProteinTextField.text = proteinTextField1.text
        finalCarbsTextField.text = carbsTextField1.text
        finalFatTextField.text = fatTextField1.text
        
    }
    
    @IBAction func doneClicked(_ sender: UIButton) {
        
        finalMeal.name = finalFoodNameTextField.text!
        finalMeal.mealMacros = Macros(calories: Int(finalCaloriesTextField.text!)!, protein: Int(finalProteinTextField.text!)!, carbs: Int(finalCarbsTextField.text!)!, fat: Int(finalFatTextField.text!)!)
        // TO DO INGREDIENTS
        finalMeal.serving = Int(finalServingTextField.text!)!
        
        if let vcDelegate = presetMealViewControllerDelegate {
            vcDelegate.setCustomMealName(meal: finalMeal)
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
    
    
}

