//
//  main.swift
//
//  Created by Елена Русских on 12.06.2022.
//

import Foundation

var breakfast = Breakfast()

do{
    try breakfast.addDish(addDish: .init(name: .salat))
    try breakfast.addDish(addDish: .init(name: .panecakes, weight: 150))
    try breakfast.addDish(addDish: .init(name: .panecakes, weight: -20))
    try breakfast.shareWithFriends()
} catch DishError.invalidValue {
    print("Вес блюда должен быть больше нуля.")
} catch DishError.emptyBreakfast {
    print("Ввведите для начала блюдо на завтрак.")
}

print(breakfast)

var breakfast2 = Breakfast()
print(breakfast2)
do{
    try breakfast2.shareWithFriends()
} catch DishError.emptyBreakfast {
    print("Ввведите для начала блюдо на завтрак.")
}



