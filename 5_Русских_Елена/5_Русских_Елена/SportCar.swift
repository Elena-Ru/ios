//
//  ClassSportCar.swift
//  5_Русских_Елена
//
//  Created by Елена Русских on 04.06.2022.
//

import Foundation

class SportCar: Car
{
    
    var windowsStatus: WindowsStatus
    
    var brand: String
    
    var yearOfProduction: Int
    
    var color: Colors
    
    var engineStatus: EngineStatus
    
    var aerodinamicKits = Set<AerodynamicKits> ()  //Тип аэродинамических обвесов
    
    var raceStatus : TakePartInRace {  // участвует ли в соревнованиях
        didSet{
            if self.raceStatus == .yes {
                raceCount += 1
                isWin = Bool.random()
                if isWin{
                    winRaceCount += 1
                }
            }
        }
    }
    lazy var raceCount: Int = 0 //счетчик участия в соревнованиях
       
    lazy var winRaceCount: Int = 0 //   счетчик побед в соревнованиях
        
    lazy var isWin: Bool = false // победил ли в гонке?
    
    init() {
        self.brand = "Toyota"
        self.yearOfProduction = 2020
        self.color = .blue
        self.engineStatus = EngineStatus.off
        self.windowsStatus = WindowsStatus.closed
        self.raceStatus = TakePartInRace.no
    }
    
    init( brand: String, yearOfProduction: Int, color: Colors) {
        self.brand = brand
        self.yearOfProduction = yearOfProduction
        self.color = color
        self.engineStatus = EngineStatus.off
        self.windowsStatus = WindowsStatus.closed
        self.raceStatus = TakePartInRace.no
    }
    func action() {
        action(operation: .switchRaceStatus(.yes))
        action(operation: .aerodynamicKitStatus(.add, .spoiler))
    }
    
    func action(operation: OperationsSportCar) {
        switch operation {
        case .aerodynamicKitStatus(let aerodynamycKitsAction, let aerodynamicKits):
            switch aerodynamycKitsAction {
            case .add:
                self.aerodinamicKits.insert(aerodynamicKits)
            case .delete:
                self.aerodinamicKits.remove(aerodynamicKits)
            }
        case .switchRaceStatus(let status):
            self.raceStatus = status
        }
    }
}
