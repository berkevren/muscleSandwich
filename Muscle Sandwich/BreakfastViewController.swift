//
//  SecondViewController.swift
//  Muscle Sandwich
//
//  Created by Berk Abbasoglu on 09/11/2016.
//  Copyright © 2016 Berk Abbasoglu. All rights reserved.
//

import UIKit

class BreakfastViewController: UIViewController {
    
    
    // variables
    var caloriesViewControllerDelegate:CaloriesViewControllerDelegate?
    
    // macros text fields
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet weak var proteinTextField: UITextField!
    @IBOutlet weak var carbsTextField: UITextField!
    @IBOutlet weak var fatTextField: UITextField!
    @IBOutlet weak var foodNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        
        self.removeAnimate()
        
    }
    
    // add meal
    @IBAction func doneClicked(_ sender: UIButton) {
        
        // make sure user entered food name
        if foodNameTextField.text == "" {
            
            // alert controller
            let noFoodNameError:UIAlertController = UIAlertController(title: "Food Name", message: "Please enter a food name", preferredStyle: UIAlertControllerStyle.alert)
            
            // alert action
            let okButton:UIAlertAction = UIAlertAction(title: "OK", style: .cancel) {
                
                (action) in
                noFoodNameError.dismiss(animated: true, completion: nil)
                
            }
            
            // add action
            noFoodNameError.addAction(okButton)
            // present view controller
            present(noFoodNameError, animated: true, completion: nil)
            
            return
            
        }
        
        if caloriesTextField.text == "" {
            
            caloriesTextField.text = "0"
            
        }
        
        if proteinTextField.text == "" {
            
            proteinTextField.text = "0"
            
        }
        
        if carbsTextField.text == "" {
            
            carbsTextField.text = "0"
            
        }
        
        if fatTextField.text == "" {
            
            fatTextField.text = "0"
            
        }
        
        // go back to calories vc
        if let vcDelegate = caloriesViewControllerDelegate {
            
            vcDelegate.addMacros(caloriesToAdd: Int(caloriesTextField.text!)!, proteinToAdd: Int(proteinTextField.text!)!, carbsToAdd: Int(carbsTextField.text!)!, fatToAdd: Int(fatTextField.text!)!)
            
            
        }
        
        self.removeAnimate()
        
    }
    
    // animate methods
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
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

