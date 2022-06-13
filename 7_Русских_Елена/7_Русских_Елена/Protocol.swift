//
//  Protocol.swift
//
//  Created by Елена Русских on 12.06.2022.
//

import Foundation

protocol Meal{
    static var totalCal: Int {set get}
    func addDish(addDish dish: Dish)
}

