//
//  Structure_Meal.swift
//
//  Created by Елена Русских on 12.06.2022.
//

import Foundation

struct Dish: Equatable, CustomStringConvertible, Hashable, Error {
    var description: String{
        return "Блюдо: \(self.name) \(self.emoji)\nВес в граммах:  \(self.weightGram)\nКаллорийность блюда: \(dishCallories)\n"
    }
    
    var name: Dishes
    private let emoji: Character
    var weightGram: Int
    private var CalloriesNa100Gramm: Int
    var dishCallories: Int{
        weightGram * CalloriesNa100Gramm / 100
    }

    init (name: Dishes, weight: Int = 100) throws{
        guard weight > 0 else {
            throw DishError.invalidValue
        }
        self.name = name
        self.weightGram = weight
        switch name{
        case .bread:
            self.emoji = "🍞"
            self.CalloriesNa100Gramm = 400
        case .boiledEggs:
            self.emoji = "🥚"
            self.CalloriesNa100Gramm = 110
        case .searreal:
            self.emoji = "🍲"
            self.CalloriesNa100Gramm = 345
        case .salat:
            self.emoji = "🥗"
            self.CalloriesNa100Gramm = 150
        case .chickenSuop:
            self.emoji = "🥘"
            self.CalloriesNa100Gramm = 260
        case .panecakes:
            self.emoji = "🥞"
            self.CalloriesNa100Gramm = 350
        }
    }
}

