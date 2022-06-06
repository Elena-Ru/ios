//
//  Enums.swift
//  5_Русских_Елена
//
//  Created by Елена Русских on 04.06.2022.
//

import Foundation

enum Colors: CustomStringConvertible {
    case red, green, blue, white, black, pink
    
    var description: String{
        switch self {
        case .red:
            return "красный"
        case .green:
            return "зелёный"
        case .blue:
            return "синий"
        case .white:
            return "белый"
        case .black:
             return "черный"
        case .pink:
            return "розовый"
        }
    }
}

enum EngineStatus : CustomStringConvertible {
    case on, off
    
    var description: String{
        switch self {
        case .on:
            return "Двигатель заведён."
        case .off:
            return "Двигатель заглушен."
        }
    }
}

enum WindowsStatus : CustomStringConvertible {
    case opened, closed
    
    var description: String{
        switch self {
        case .opened:
            return "Окна открыты."
        case .closed:
            return "Окна закрыты."
        }
    }
}

enum AerodynamicKits: CustomStringConvertible {
    case frontBamder, backBamper, spoiler, thresholdsKits
    
    var description: String {
        switch self {
            
        case .frontBamder:
            return "передний бампер"
        case .backBamper:
            return "задний бампер"
        case .spoiler:
            return "спойлер"
        case .thresholdsKits:
            return "обвесы на порогах"
        }
    }
}

enum AerodynamycKitsAction: CustomStringConvertible {
    case add, delete
    
    var description: String {
        switch self{
        case .add:
            return "Добавлен"
        case .delete:
            return "Удален"
        }
            
    }
}
    
enum TakePartInRace {
    case yes, no
}

enum OperationsSportCar {
    case aerodynamicKitStatus( AerodynamycKitsAction, AerodynamicKits)
    case switchRaceStatus (TakePartInRace)
}

enum Cargo: CustomStringConvertible{
    
    case oilProducts, gasProducts, mealProduct
    
    var description: String {
        switch self {
        case .oilProducts:
            return "Цистерна для перевозки нефтепродуктов."
        case .gasProducts:
            return "Цистерна для перевозки пищевых продуктов."
        case .mealProduct:
            return "Цистерна для перевозки газа."
        }
    }
}

enum CargoStatus: CustomStringConvertible{
    case load, unload
    var description: String {
        switch self {
        case .load:
            return "Цистерна заполнена."
        case .unload:
            return "Цистерна пуста."
        }
    }
}

enum CarryCargoStatus: CustomStringConvertible{
    case yes(cityDeparture: City, cityDestination: City), no
    var description: String{
        switch self {
        case .yes( let cityDep, let cityDest):
            
            return "Автоцистерна отправлена в рейс.\nГород отправления -\(cityDep)\nГород назначения - \(cityDest)"
        case .no:
            return "Автоцистерна не отправлена в рейс."
        }
    }
}

enum City: CustomStringConvertible{
    case moskva, samara, rostovNaDonu, omsk
    
    var description: String{
        switch self {
        case .moskva:
            return "Москва"
        case .samara:
            return "Самара"
        case .rostovNaDonu:
            return "Ростов-на-Дону"
        case .omsk:
            return "Омск"
        }
    }
}

enum OperationsTrunkCar {
    case switchCargoStatus (CargoStatus)
    case switchCarryStatus (CarryCargoStatus)
}

