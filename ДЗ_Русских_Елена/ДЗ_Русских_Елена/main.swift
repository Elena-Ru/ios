//
//  main.swift
//  ДЗ_Русских_Елена
//
//  Created by Елена Русских on 02.06.2022.
//

import Foundation

enum Operations {
    case switchEngine (EngineStatus)
    case switchWindows (WindowsStatus)
    case cargo (CargoAction)
    case passangers (PassengersAction)
    case switchConditioner (ConditionerStatus)
    case race (TakePartinRace)
    case runWorkigShift (workShift)
    case runHeavyTruckTO (HeavyTruckTO)
}

enum EngineStatus{
    case on, off
    var description: String{
        switch self {
        case .on:
            return "Двигатель включен."
        case .off:
            return "Двигатель выключен."
        }
    }
}

enum WindowsStatus: CustomStringConvertible{
    case open, close
    var description: String{
        switch self {
        case .open:
            return "Окна открыты."
        case .close:
            return "Окна закрыты."
        }
    }
}

enum CargoAction:CustomStringConvertible {
    case load (volume: Double), unload (volume: Double)
    var description: String{
        switch self {
            case .load(let load):
                return "Загружено в багажник \(load)."
            case .unload(let unload):
                return "Выгружено из багажника \(unload)."
        }
    }
}

enum PassengersAction{
    case onBoard (countOfPas: Int), offBoard (countOfPas: Int)
}

enum ConditionerStatus: CustomStringConvertible {
    case on, off
    var description: String{
        switch self {
        case .on:
            return "Кондиционер включён."
        case .off:
            return "Кондиционер выключен."
        }
    }
}

enum TakePartinRace: CustomStringConvertible{
    case yes, no
    var description: String{
        switch self {
        case .yes:
            return "Автомобиль принимает участие в гонках."
        case .no:
            return "Автомобиль не соревнуется."
        }
    }
}

enum workShift: CustomStringConvertible{
    case open, add(workigHours: Int), close
    var description: String{
        switch self {
        case .open:
            return "открыта."
        case .close:
            return "закрыта."
        case .add(workigHours: let workigHours):
            return "Добавлено \(workigHours) часов в рабочую смену"
        }
    }
}

enum HeavyTruckTO: CustomStringConvertible{
    case run, close
    var description: String {
        switch self{
        case .run:
            return "Автомобиль проходит ТО."
        case .close:
            return "Автомобиль прошёл ТО."
        }
    }
}

//Родительский класс Car
class Car: CustomStringConvertible{
    static var carCount = 0 // к-во выпущенных машин
    var carBrand: String
    var yearOfManufacture: Int {
        willSet{
            if (newValue > 2022 || newValue < 1930 ) {
                print("Год выпуска автомобиля введён не корректно!\nГод будет изменен на 2020.")
            }
        }
        didSet{
            if (yearOfManufacture > 2022 || yearOfManufacture < 1930 ) {
                yearOfManufacture = 2020
            }
                print("Год выпуска = \(yearOfManufacture)")
        }
    }
    let volumeTrunk: Double
    var filledVolumeTruck: Double = 0      // заполненный объем
    var freeVolumeTruck: Double {          // свободный объём в багажнике
        volumeTrunk - filledVolumeTruck
   }
    var loadVolume: Double  = 0 {      //объём загружаемого груза
         didSet{
              loadVolume = funcSet(setValue: loadVolume, operation: "load")
          //нельзя погрузить больше, чем есть свободного места
              if loadVolume > freeVolumeTruck{
                  print("Ошибка!\nГруз объёмом \(loadVolume) не поместится в этот автомобиль!")
                  loadVolume = 0
              }
         }
    }
       var unloadVolume: Double = 0 {           // обьем выгруженного груза
          didSet {
            unloadVolume = funcSet(setValue: unloadVolume, operation: "unload")
              //нельзя выгрузить больше , чем уже загружено
            if unloadVolume > filledVolumeTruck{
                print("Ошибка!\nОбъём выгружаемого груза не должен превышать заполенного объема багажника")
                unloadVolume = 0
            }
          }
      }
    var engineStatus: EngineStatus  = .off // состояние двигателя
    var windowsStatus: WindowsStatus = .close // cостояние окон
    
    var description: String {
        return("*********\nАвтомобиль марки - \(carBrand.capitalized)\nГод выпуска - \(yearOfManufacture)\nОбъём багажника(заполнено/общий) -\(filledVolumeTruck)/ \(volumeTrunk)\nДвигатель сейчан - \(engineStatus.description)\nОкна сейчас - \(windowsStatus)")
    }
    
    func funcSet(setValue: Double, operation: String) -> Double{
        var value = setValue
        let operat = (operation == "load") ? "погрузить" : "выгрузить"
        if value < 0{
            print("Ошибка!\nНельзя \(operat) отрицательный объём \(setValue)")
            print("Возможно Вы имели ввиду \(-1 * value)? Введите y/n ")
            if let enteredValue = readLine(){
                switch enteredValue{
                case "y", "Y":
                    value *= -1
                case "n", "N":
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
    
    func operat(operation: Operations){
        switch operation{
        case .switchEngine(let status):
            engineStatus = status
        case .switchWindows(let status):
            windowsStatus = status
        case .cargo(let act):
            switch act{
            case .load(volume: let a):
                loadVolume = a
                self.filledVolumeTruck = filledVolumeTruck + loadVolume - unloadVolume
               guard loadVolume < 0 else {return print("Поместили в багажник груз объёмом \(loadVolume)")}
            case .unload(volume: let b):
                unloadVolume = b
                self.filledVolumeTruck -= unloadVolume
                guard unloadVolume < 0 else {return print("Выгрузили из багажника груз объёмом \(unloadVolume)")}
            }
        default: print("Это действие не доступно")
        }
    }

    init(carBrand: String, yearOfManufacture: Int, volumeTrunk: Double){
        if carBrand.count < 3{
            print("Ошибка! Марка автомобиля введена не корректно. Будет измененна на Mercedes.")
            self.carBrand = "Mercedes"
        } else {
            self.carBrand = carBrand
        }
        if (yearOfManufacture > 2022 || yearOfManufacture < 1930 ) {
            print("Ошибка! Год выпуска введен не корректно. Год будет изменен на 2020.")
            self.yearOfManufacture = 2020
        }else {
            self.yearOfManufacture = yearOfManufacture
        }
        if volumeTrunk < 0 {
            print("Ошибка! Объем кузова/багажника не может быть отрицательным.")
            self.volumeTrunk = volumeTrunk * (-1)
        }else{
            self.volumeTrunk = volumeTrunk
        }
        Car.carCount += 1
    }
    
    deinit{
        Car.carCount -= 1
    }
}


//class SportCar

class SportCar: Car{
    static var sportCarCount = 0 // кол-во SportCar
    enum WKAccess: CustomStringConvertible{
        case yes, no
        var description: String{
            switch self {
            case .yes:
                return "да"
            case .no:
                return "нет"
            }
        }
    }

    enum SeatsCount: Int{
        case one = 1, two, three, four
    }
    
    let withoutKeyAccess: WKAccess   // бесключевой доступ
    var contitionerStatus: ConditionerStatus = .off  //статус кондиционера
    lazy var raceCount: Int = 0 //счетчик участия в соревнованиях
    lazy var winRaceCount: Int = 0 //   счетчик побед в соревнованиях
    lazy var isWin: Bool = false // победил ли в гонке?
    
    var raceParticipation: TakePartinRace {  //принятие участия в соревнованиях
        didSet{
            if self.raceParticipation == .yes{
                if self.passangerCount > 0{
                    print("Внимание! Вы не можете принимать участие в гонках,  пока у вас в автомобиле есть пассажиры. Прийдется их высадить!")
                    self.passangerCount = 0 // высадили всех пассажиров
                }
                raceCount += 1
                isWin = Bool.random()
                if isWin{
                    winRaceCount += 1
                }
            }
        }
    }
    
    var passangerCount:Int = 0 {        // - кол-во пассажиров
        didSet{
            guard passangerCount >= 0 else {
                print("Количество пассажиров не может быть отрицательным.")
                passangerCount = 0
                return print("В автомобиль добавилось \(passangerCount) пассажиров")
            }
            if  passangerCount > passengerSeatsCount.rawValue {
                //print(passangerCount)
                print("Ошибка! Пассажиров не может быть больше, чем мест для них.")
                passangerCount = passengerSeatsCount.rawValue
                return print("В автомобиль добавилось \(passangerCount) пассажиров")
            }
        }
    }
    var passengerSeatsCount:SeatsCount       //кол-во мест для пассажиров
    var passengerSeatsCountFree: Int {         // кол-во свободных мест для пассажиров
            passengerSeatsCount.rawValue - passangerCount
    }

    override var description: String{
        let str = "\nБезключевой доступ - \(withoutKeyAccess)\nКоличество пассажирских мест - \(passengerSeatsCount.rawValue)\nКоличество пассажиров -  \(passangerCount)\nСостояние кондиционера - \(contitionerStatus)\nУчастие в гонках - \(raceParticipation)"
        guard self.raceParticipation != .yes else {
            return super.description + str + "\nКоличество участия в гонках - \(raceCount)\nИз них завершились победой - \(winRaceCount)\n*********"
        }
        return super.description + str + "\n*********"
    }
   
    override func operat(operation: Operations) {
        switch operation {
      
        case .passangers(let passengersAction):
            switch passengersAction{
            case .onBoard(countOfPas: var a):
                if a < 0 {
                    a *= (-1)
                }
                if a > passengerSeatsCountFree {
                    print("К сожалению, \(a - passengerSeatsCountFree)чел. не поместились! ")
                    passangerCount = passengerSeatsCount.rawValue
                } else{
                    passangerCount += a
                }
                print("В автомобиль добавилось \(a) пассажиров")
            case .offBoard(countOfPas: var b):
                if b < 0 {
                    b *= (-1)
                }
                if b >= passangerCount {
                    print("Из автомобиля вышли \(passangerCount) пассажиров")
                    passangerCount = 0
                } else{
                    passangerCount -= b
                    print("Из автомобиля вышли \(b) пассажиров")
                }
        }
        case.switchConditioner(let status):
            contitionerStatus = status
            print(contitionerStatus)
        case .race(let status):
            raceParticipation = status
        default: super.operat(operation: operation)
        }
    }
    
    
    init(carBrand: String, yearOfManufacture: Int, volumeTrunk: Double, passengerSeatsCount: SeatsCount, raceParticipation: TakePartinRace, withoouKeyAcces: WKAccess) {
        self.passengerSeatsCount = passengerSeatsCount
        self.raceParticipation = raceParticipation
        self.withoutKeyAccess = withoouKeyAcces
        super.init(carBrand: carBrand, yearOfManufacture: yearOfManufacture, volumeTrunk: volumeTrunk)
        SportCar.sportCarCount += 1
    }
    deinit{
        SportCar.sportCarCount -= 1
    }
}

class TrunkCar: Car{
    
    static var trunkCarCount = 0
    
    enum City:CustomStringConvertible{
        case Moskva, Samara, Ryazan, RostovNaDonu, Ufa
        
        var description: String{
            switch self {
            case .Moskva:
                return "Москва"
            case .Samara:
                return "Самара"
            case .Ryazan:
                return "Рязань"
            case .RostovNaDonu:
                return "Ростов-на-Дону"
            case .Ufa:
                return "Уфа"
            }
        }
        
    }
    
    let cityDeparture: City         //город отправления
    let cityDestination: City       // город назначения
    
    var workigShift : workShift = .close {           // рабочая смена водителя
        willSet{
             print("Смена \(newValue)")
       }
    }

    lazy var workigShiftTime: Int = 0 {
        didSet{
            if workigShiftTime > 10 {
                workigShiftTime = 10
                print("Рабочая смена не может продолжаться более 10 часов в сутки. Смена будет закрыта.")
                workigShift = .close
            }
        }
    }
    
    var heavyTO: HeavyTruckTO {
        didSet{
            print(heavyTO)
        }
    }
    
    override func operat(operation: Operations) {
        switch operation {
            case .runWorkigShift(let status):
            switch status {
            case .open:
                workigShift = status
            case .add(var workigHours):         //добавлем часы в рабочую смену
                if workigHours < 0 {
                    print("Ошибка! Рабочее время не может быть отрицательным.")
                    workigHours *= (-1)
                }
                workigShift = .open
                workigShiftTime += workigHours
            case .close:
                workigShift = status
            }
            case .runHeavyTruckTO(let status):
                heavyTO = status
            default:
                super.operat(operation: operation)
        }
    }
    
    override var description: String{
        let str: String = "\nГород отправления - \(cityDeparture)\nГород назначения - \(cityDestination)\nСтатус ТО - \(heavyTO)\nСтатус рабочей смены водителя - \(workigShift)"
        if workigShiftTime > 0 {
            guard workigShiftTime != 10 else{
                return super.description + str + "\nРабочая смена продолжалась - \(workigShiftTime) часов\n*********"
            }
            return super.description + str + "\nРабочая смена продолжается уже - \(workigShiftTime) часов\n*********"
        } else {
        return super.description + str + "\n*********"
        }
    }
    
    init(carBrand: String, yearOfManufacture: Int, volumeTrunk: Double, heavyTO: HeavyTruckTO, cityDeparture: City, cityDestination: City){
        self.heavyTO = heavyTO
        self.cityDeparture = cityDeparture
        self.cityDestination = cityDestination
        super.init(carBrand: carBrand, yearOfManufacture: yearOfManufacture, volumeTrunk: volumeTrunk)
        TrunkCar.trunkCarCount += 1
    }
    deinit{
        TrunkCar.trunkCarCount -= 1
    }
}
    
var trunkCar1 = TrunkCar(carBrand: "Mn", yearOfManufacture: 20, volumeTrunk: -1000, heavyTO: .close, cityDeparture: .Moskva, cityDestination: .Samara)
trunkCar1.operat(operation: .race(.yes))
trunkCar1.operat(operation: .switchEngine(.on))
trunkCar1.operat(operation: .runWorkigShift(.add(workigHours: 7)))
trunkCar1.operat(operation: .runHeavyTruckTO(.run))
print(trunkCar1)


var trunkCar2 = TrunkCar(carBrand: "Man", yearOfManufacture: 1998, volumeTrunk: 2000, heavyTO: .run, cityDeparture: .RostovNaDonu, cityDestination: .Ryazan)
//trunkCar2.operat(operation: .cargo(.unload(volume: -60)))
trunkCar2.operat(operation: .cargo(.load(volume: 800)))
trunkCar2.operat(operation: .cargo(.load(volume: 2000)))
trunkCar2.operat(operation: .cargo(.unload(volume: 500)))
trunkCar2.operat(operation: .passangers(.offBoard(countOfPas: 50)))
trunkCar2.operat(operation: .runWorkigShift(.open))
trunkCar2.operat(operation: .runWorkigShift(.add(workigHours: 3)))
trunkCar2.operat(operation: .runWorkigShift(.add(workigHours: -67)))
print(trunkCar2)

var sportCar1: SportCar? = SportCar(carBrand: "HoNDA", yearOfManufacture: 1988, volumeTrunk: 300, passengerSeatsCount: .four, raceParticipation: .no, withoouKeyAcces: .yes)
sportCar1?.operat(operation: .runWorkigShift(.open))
sportCar1?.operat(operation: .switchConditioner(.on))
sportCar1?.operat(operation: .switchEngine(.on))
sportCar1?.passangerCount = 6
sportCar1?.operat(operation: .passangers(.offBoard(countOfPas: -3)))
sportCar1?.operat(operation: .passangers(.onBoard(countOfPas: 2)))
sportCar1?.operat(operation: .passangers(.offBoard(countOfPas: 5)))
print(sportCar1)

var sportCar2 = SportCar(carBrand: "Toyota", yearOfManufacture: 2021, volumeTrunk: 100, passengerSeatsCount: .three, raceParticipation: .no, withoouKeyAcces: .yes)
sportCar2.operat(operation: .passangers(.onBoard(countOfPas: 2)))
for _ in 1...5 {
    sportCar2.operat(operation: .race(.yes))
}
sportCar2.operat(operation: .runHeavyTruckTO(.run))
print(sportCar2)

var sportCar3 = SportCar(carBrand: "BMW", yearOfManufacture: 1988, volumeTrunk: 200, passengerSeatsCount: .four, raceParticipation: .no, withoouKeyAcces: .yes)
sportCar3.operat(operation: .cargo(.load(volume: 500)))
print(sportCar3)

print("Общее кол-во созданных объектов автомобилей =  \(Car.carCount).\nИз них легковых = \(SportCar.sportCarCount) и грузовых = \(TrunkCar.trunkCarCount)")

sportCar1 = nil

print("Общее кол-во созданных объектов автомобилей =  \(Car.carCount).\nИз них легковых = \(SportCar.sportCarCount) и грузовых = \(TrunkCar.trunkCarCount)")
