//
//  main.swift
//  Русских_Елена
//
//  Created by Елена Русских on 26.05.2022.
//

import Foundation

struct SportCar {

    enum Operations{
        case motor (actionWithMotor: motorAction)
        case window (actionWithWindow: windowAction)
        case cargo (actionWithCargo: cargoAction)
    }
    enum motorAction {
        case on, off
    }
    enum windowAction {
        case open,close
    }
    enum cargoAction {
        case load (volume: Double), unload (volume: Double)
    }
    
    let carBrand: String
    let yearOfManufacture: Int
    let volumeTrunk: Double
    var filledVolumeTruck: Double = 0
    // свободный объём в багажнике
    var freeVolumeTruck: Double {
        volumeTrunk - filledVolumeTruck
    }
    //объём загружаемого груза
   var loadVolume: Double  = 0 {
       didSet{
            loadVolume = funcSet(setValue: loadVolume, operation: "load")
        //нельзя погрузить больше, чем есть свободного места
            if loadVolume > freeVolumeTruck{
                print("Ошибка!\nГруз объёмом \(loadVolume) не поместится в этот автомобиль!")
                loadVolume = 0
            }
       }
    }
    // обьем выгруженного груза
     var unloadVolume: Double = 0 {
        didSet {
          unloadVolume = funcSet(setValue: unloadVolume, operation: "unload")
            //нельзя выгрузить больше , чем уже загружено
          if unloadVolume > filledVolumeTruck{
              print("Ошибка!\nОбъём выгружаемого груза не должен превышать заполенного объема багажника")
              unloadVolume = 0
          }
        }
    }
    var isOnMotor: Bool {
        didSet{
            isOnMotor ? print("Двигатель включён!") : print("Двигатель выключен!")
        }
    }
    var isOpenWindows: Bool {
        didSet{
            isOpenWindows ? print("Окна открыты!") : print("Окна закрыты")
        }
    }
   
    //устанавливаем значение объёма для погрузки/выгрузки
    //нельзя погрузить/выгрузить груз с отрицательным объёмом
    mutating func funcSet(setValue: Double, operation: String) -> Double{
        var value = setValue
        let operat = (operation == "load") ? "погрузить" : "выгрузить"
        if value < 0{
            print("Ошибка!\nНельзя \(operat) отрицательный объём \(setValue).")
            print("Возможно Вы имели ввиду \(-1 * value)? Введите y/n ")
            if let enteredValue = readLine(){
                switch enteredValue{
                case "y", "Y":
                    value *= -1
                case "n", "N":
                    print("Ошибка! Действие не будет выполнено.")
                    value = 0
                default:
                    value = 0
                    print("Попробуйте ввести параметр еще раз.")
                    return value
                }
            }
        }
        return value
    }
    
    mutating func operat (typeOfAction action: Operations){
        
        switch action {
        case .motor(actionWithMotor: .on):
            self.isOnMotor = true
        case .motor(actionWithMotor: .off):
            self.isOnMotor = false
        case .window(actionWithWindow: .open):
            self.isOpenWindows = true
        case .window(actionWithWindow: .close):
            self.isOpenWindows = false
        case .cargo(actionWithCargo: .load(volume: let a)):
            loadVolume = a
            self.filledVolumeTruck = filledVolumeTruck + loadVolume - unloadVolume
           guard loadVolume < 0 else {return print("Поместили в багажник груз объёмом \(loadVolume).")}
        case .cargo(actionWithCargo: .unload(volume: let b)):
            unloadVolume = b
            self.filledVolumeTruck -= unloadVolume
            guard unloadVolume < 0 else {return print("Выгрузили из багажника груз объёмом \(unloadVolume).")}
        }
    }
    func printCar(){
        print("\n***Текущие свойства экземпляра***\n")
        print("Марка автомобиля - \(carBrand).")
        print("Год выпуска = \(yearOfManufacture).")
        print("Объём багажника = \(volumeTrunk).")
        print("Заполненный объём багажника = \(filledVolumeTruck).")
        isOnMotor ? print("Двигатель сейчас включён.") : print("Двигатель сейчас выключен.")
        isOpenWindows ? print("Окна сейчас открыты.") : print("Окна сейчас закрыты.")
    }
    
    init(){
        self.carBrand = "Volkswagen"
        self.yearOfManufacture = 2020
        self.isOpenWindows = false
        self.filledVolumeTruck = 0
        self.volumeTrunk = 500
        self.isOnMotor = false
        self.unloadVolume = 0
        self.loadVolume = 0
    }
    init?(carBrand brand: String, yearOfManufacture year: Int, isOpenWindows windows: Bool, volumeTrunk fulVolume: Double, isOnMotor motor: Bool){
        self.carBrand = brand.capitalized
        guard brand != "" else {
            print("Ошибка!\nНазвание марки автомобиля не может быть пустой строкой!")
            return nil}
        self.yearOfManufacture = year
        guard year > 1930 && year < 2022 else {
            print("Ошибка!\nГод выпуска автомобиля введён не корректно!")
            return nil
        }
        self.isOpenWindows = windows
        self.volumeTrunk = fulVolume
        guard fulVolume >= 0 else{
            print("Ошибка!\nОбъём багажника не может быть меньше 0!")
            return nil
        }
        self.isOnMotor = motor
    }
}


var car1 = SportCar()

car1.operat(typeOfAction: .cargo(actionWithCargo: .load(volume: 1000)))
car1.operat(typeOfAction: .cargo(actionWithCargo: .load(volume: -30)))
car1.operat(typeOfAction: .cargo(actionWithCargo: .load(volume: 100)))
car1.operat(typeOfAction: .cargo(actionWithCargo: .unload(volume: 40)))
car1.operat(typeOfAction: .cargo(actionWithCargo: .unload(volume: -300)))
car1.operat(typeOfAction: .window(actionWithWindow: .open) )
car1.operat(typeOfAction: .motor(actionWithMotor: .off))

car1.printCar()

print("\n***Моделирование ошибки инициализации***")
if let car2 = SportCar(carBrand: "hoNDA", yearOfManufacture: 1967, isOpenWindows: true, volumeTrunk: -80, isOnMotor: false){
    car2.printCar()
} else{
    print("Ошибка инициализации.  Экземпляр не создался. Введите корректные данные.")
}

print("\n***Моделирование ошибки инициализации***")
if let car3 = SportCar(carBrand: "", yearOfManufacture: 1967, isOpenWindows: true, volumeTrunk: 300, isOnMotor: false){
   car3.printCar()
} else{
   print("Ошибка инициализации.  Экземпляр не создался. Введите корректные данные.")
}

print("\n***Моделирование ошибки инициализации***")
if let car4 = SportCar(carBrand: "HoNDA", yearOfManufacture: -99, isOpenWindows: true, volumeTrunk: 300, isOnMotor: false){
   car4.printCar()
} else{
   print("Ошибка инициализации.  Экземпляр не создался. Введите корректные данные.")
}

if var car5 = SportCar(carBrand: "HoNDA", yearOfManufacture: 1988, isOpenWindows: true, volumeTrunk: 300, isOnMotor: false){
    car5.operat(typeOfAction: .motor(actionWithMotor: .on))
    car5.operat(typeOfAction: .cargo(actionWithCargo: .load(volume: 200)))
    car5.operat(typeOfAction: .cargo(actionWithCargo: .unload(volume: 150)))
    car5.printCar()
} else{
   print("Ошибка инициализации.  Экземпляр не создался. Введите корректные данные.")
}



