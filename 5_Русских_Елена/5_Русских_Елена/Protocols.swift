//
//  Protocols.swift
//  5_Русских_Елена
//
//  Created by Елена Русских on 04.06.2022.
//

import Foundation

protocol Car {
    var brand : String {get}
    var yearOfProduction : Int {get}
    var color : Colors {get set}
    var engineStatus : EngineStatus {get set}
    var windowsStatus : WindowsStatus {get set}
    
    mutating func action ()
}



