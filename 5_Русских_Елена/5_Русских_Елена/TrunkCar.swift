//
//  ClassTrunkCar.swift
//  5_Русских_Елена
//
//  Created by Елена Русских on 04.06.2022.
//

import Foundation

class TrunkCar: Car
{
    let typeOfCargo: Cargo
    
    var windowsStatus: WindowsStatus
    
    var brand: String
    
    var yearOfProduction: Int
    
    var color: Colors
    
    var engineStatus: EngineStatus
    
    var cargoStatus: CargoStatus = .unload
    
    var carryCargoStatus: CarryCargoStatus

    lazy var cityDeparture: City? = nil
    
    lazy var cityDestination: City? = nil
    
    init( brand: String, yearOfProduction: Int, color: Colors, typeOfCargo : Cargo) {
        self.brand = brand
        self.yearOfProduction = yearOfProduction
        self.color = color
        self.engineStatus = EngineStatus.off
        self.windowsStatus = WindowsStatus.closed
        self.typeOfCargo = typeOfCargo
        self.carryCargoStatus = .no
    }
    
    func action() {
        action(operation: .switchCargoStatus(.load))
    }

    func action(operation: OperationsTrunkCar){
        switch operation {
        case .switchCargoStatus(let status):
            self.cargoStatus = status
        case .switchCarryStatus( let status):
            self.carryCargoStatus = status
        }
    }
}
