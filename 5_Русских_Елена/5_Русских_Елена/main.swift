//
//  main.swift
//  5_Русских_Елена
//
//  Created by Елена Русских on 03.06.2022.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

var trunkCar1 = TrunkCar(brand: "Man", yearOfProduction: 2008, color: .black, typeOfCargo: .gasProducts)
var sportCar2 = SportCar(brand: "Audi", yearOfProduction: 2016, color: .white)

var arr: [Car] = []
arr.append(trunkCar1)
arr.append(sportCar2)

for var car in arr {
    car.action()
    print(car)
}


var trunkCar = TrunkCar(brand: "Toyota", yearOfProduction: 1998, color: .green, typeOfCargo: .gasProducts)
trunkCar.switchEngine(status:.on)
trunkCar.switchWindows(status: .closed)
trunkCar.color = .pink
trunkCar.action(operation: .switchCarryStatus(.no))
trunkCar.action(operation: .switchCargoStatus(.load))
trunkCar.action(operation: .switchCarryStatus(.yes(cityDeparture: .rostovNaDonu, cityDestination: .omsk)))
trunkCar.cityDeparture = .samara
print(trunkCar)

var sportCar1 = SportCar()
sportCar1.switchWindows(status: .opened)
sportCar1.action(operation: .aerodynamicKitStatus(.add, .frontBamder))
sportCar1.action()
sportCar1.action(operation: .aerodynamicKitStatus(.delete, .frontBamder))
sportCar1.action(operation: .aerodynamicKitStatus(.add, .thresholdsKits))
for _ in 1...4 {
sportCar1.action(operation: .switchRaceStatus(.yes))
}
print(sportCar1)












