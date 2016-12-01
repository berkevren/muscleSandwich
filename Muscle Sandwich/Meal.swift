//
//  Meal.swift
//  Muscle Sandwich
//
//  Created by Berk Abbasoglu on 30/11/2016.
//  Copyright © 2016 Berk Abbasoglu. All rights reserved.
//

import Foundation

class Meal {
    
    var name : String
    var serving : Int
    var mealMacros : Macros
    var ingredients : [Meal]

    init() {
        
        name = ""
        serving = 0
        mealMacros = Macros(calories: 0, protein: 0, carbs: 0, fat: 0)
        ingredients = [Meal]()
        
    }
}
