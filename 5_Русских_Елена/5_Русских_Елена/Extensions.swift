//
//  Extensions.swift
//  5_Русских_Елена
//
//  Created by Елена Русских on 04.06.2022.
//

import Foundation

extension Car {
    mutating func switchEngine (status: EngineStatus) {
        engineStatus = status;
        }
    mutating func switchWindows (status: WindowsStatus){
        windowsStatus = status
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\(typeOfCargo) 🚚\nМарка- \(brand)\nГод производства - \(yearOfProduction)\nЦвет- \(color)\n\(engineStatus)\n\(windowsStatus)\n\(cargoStatus)\n\(carryCargoStatus)"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        var str: String = ""
        if self.raceCount > 0 {
            str = "Кол-во гонок, в которых принял участие автомобиль - \(raceCount)\nИз них закончились победой - \(winRaceCount)"
        }
        let stringAerodinamicKits = "\(aerodinamicKits)"
        let clearAerodinamicKits = stringAerodinamicKits.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
    
        return "Спорткар 🏎\nМарка- \(brand)\nГод производства - \(yearOfProduction)\nЦвет- \(color)\n\(engineStatus)\n\(windowsStatus)\nТип аэродинамических обвесов: \(clearAerodinamicKits)\n" + str
    }
}
