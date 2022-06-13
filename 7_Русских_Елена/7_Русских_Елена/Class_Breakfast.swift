//
//  Class_Breakfast.swift
//
//  Created by Елена Русских on 12.06.2022.
//

import Foundation

class Breakfast: Meal, CustomStringConvertible {
    
    static var totalCal: Int =  0
    static var breakfastStatus: BreakfastStatus = .privateBreakfast
    var description: String {
        guard breakfastDishes.count > 0 else {
            return "На завтрак вы ничего не съели."
        }
        return "На завтрак вы съели:\n \(breakfastDishes)\nВсего ккал: \(Breakfast.totalCal)"
    }
    
    var breakfastDishes: [Dish] = []
    private var namesDishes: [Dishes] = []
    
    func addDish(addDish dish: Dish) {
        if namesDishes.contains(dish.name) {
            breakfastDishes[namesDishes.firstIndex(of: dish.name)!].weightGram += dish.weightGram
        }
        else {
            namesDishes.append(dish.name)
            breakfastDishes.append(dish)
        }
        Breakfast.totalCal += dish.dishCallories
    }
    
    func shareWithFriends() throws{
        guard breakfastDishes.count > 0 else {
            throw DishError.emptyBreakfast
        }
        Breakfast.breakfastStatus = .piblicBreakfast
    }
    
}
