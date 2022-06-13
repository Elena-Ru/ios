//
//  Enums.swift
//
//  Created by Елена Русских on 12.06.2022.
//

import Foundation

enum Dishes: String, CustomStringConvertible {
    var description: String {
        switch self {
        case .boiledEggs:
            return "вареные яйца"
        case .searreal:
            return "овсянка"
        case .salat:
            return "салат"
        case .chickenSuop:
           return "куриный суп"
        case .bread:
            return "хлеб"
        case .panecakes:
            return "блинчики"
        }
    }
    
    case boiledEggs, searreal, salat, chickenSuop, bread, panecakes
}

enum BreakfastStatus: String{
    case privateBreakfast, piblicBreakfast
}

enum DishError: Error{
    case invalidValue
    case emptyBreakfast
}


