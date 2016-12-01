//
//  FirstViewController.swift
//  Muscle Sandwich
//
//  Created by Berk Abbasoglu on 09/11/2016.
//  Copyright © 2016 Berk Abbasoglu. All rights reserved.
//

import UIKit

protocol CaloriesViewControllerDelegate {
    
    func addMacros(caloriesToAdd: Int, proteinToAdd: Int, carbsToAdd: Int, fatToAdd: Int)
}

struct Macros {
    
    var calories : Int
    var protein : Int
    var carbs : Int
    var fat : Int
    
}

class CaloriesViewController: UIViewController, CaloriesViewControllerDelegate {
    
    // variables
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addMealLabel: UILabel!
    
    // intake text fields
    @IBOutlet weak var calorieIntakeText: UITextField!
    @IBOutlet weak var proteinIntakeText: UITextField!
    @IBOutlet weak var carbsIntakeText: UITextField!
    @IBOutlet weak var fatIntakeText: UITextField!
    
    // goals text fields
    @IBOutlet weak var calorieGoalText: UITextField!
    @IBOutlet weak var proteinGoalText: UITextField!
    @IBOutlet weak var carbsGoalText: UITextField!
    @IBOutlet weak var fatGoalText: UITextField!
    
    var intake = Macros(calories: 0, protein: 0, carbs: 0, fat: 0)
    
    //label.text = result
    
    // methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rounded corners -> now done in storyboard
        //addMealLabel.layer.masksToBounds = true
        //addMealLabel.layer.cornerRadius = 5
        
        updateDay()
        refreshIntake()
        
        // open new vc
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CaloriesViewController.breakfastTapped(gestureRecognizer:)))
        addMealLabel.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // open breakfast vc
    func breakfastTapped(gestureRecognizer: UITapGestureRecognizer) {
        
        let popUpBreakfast = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "breakfast") as! BreakfastViewController
        popUpBreakfast.caloriesViewControllerDelegate = self
        self.addChildViewController(popUpBreakfast)
        popUpBreakfast.view.frame = self.view.frame
        self.view.addSubview(popUpBreakfast.view)
        popUpBreakfast.didMove(toParentViewController: self)
        
    }
    
    // protocol methods
    func addMacros(caloriesToAdd : Int, proteinToAdd: Int, carbsToAdd: Int, fatToAdd: Int) {
        
        // update values
        intake.calories += caloriesToAdd
        intake.protein += proteinToAdd
        intake.carbs += carbsToAdd
        intake.fat += fatToAdd
        
        // refresh
        refreshIntake()
        
    }
    
    // calculate current day
    func updateDay() {
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date as Date)
        
        dateLabel.text = String(describing: components.day!) + "/" + String(describing: components.month!) + "/" + String(describing: components.year!)
        dateLabel.font = UIFont.boldSystemFont(ofSize: 21)
        
    }
    
    // refresh text fields
    func refreshIntake() {
        
        // set text color after checking if goal > intake
        if Int(calorieGoalText.text!)! > intake.calories {
            calorieIntakeText.textColor = UIColor.green
        }
        
        else {
            calorieIntakeText.textColor = UIColor.red
        }
        
        if Int(proteinGoalText.text!)! > intake.protein {
            proteinIntakeText.textColor = UIColor.red
        }
            
        else {
            proteinIntakeText.textColor = UIColor.green
        }
        
        if Int(carbsGoalText.text!)! > intake.carbs {
            carbsIntakeText.textColor = UIColor.green
        }
            
        else {
            carbsIntakeText.textColor = UIColor.red
        }
        
        if Int(fatGoalText.text!)! > intake.fat {
            fatIntakeText.textColor = UIColor.green
        }
            
        else {
            fatIntakeText.textColor = UIColor.red
        }
        
        
        calorieIntakeText.text = String(intake.calories)
        proteinIntakeText.text = String(intake.protein)
        carbsIntakeText.text = String(intake.carbs)
        fatIntakeText.text = String(intake.fat)

        
    }
    
    

    
}

