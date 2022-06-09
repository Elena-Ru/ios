//
//  main.swift
//  6_Русских_Елена
//
//  Created by Елена Русских on 08.06.2022.
//
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример:
//filter для массивов)
//3. *Добавить свой subscript, который будет возвращать nil в случае обращения к
//несуществующему индексу.

import Foundation

var queueInt = Queue<Int>()
var queueString = Queue<String>()

for _ in 1...10{
   let valueInt = Int.random(in: -20...20)
    queueInt.enqueue(valueInt)
}

let arrayStr = ["Pen", "push", "sun", "cat", "city", "ios", "Mira"]
arrayStr.forEach{queueString.enqueue($0)}

queueString.dequeue()
queueString.peek()

print(queueString)
print(queueInt)

//положительные числа
print(queueInt.filter{$0 > 0})

//числа, к-е делятся на 3 без остатка
print(queueInt.filter{$0 % 3 == 0})

//длина строки больше 3х символов
print(queueString.filter{$0.count > 3 })

//cтроки, которые содержат символ "a"
print(queueString.filter{$0.contains("a")})

//cтроки, которые нначинаются с "io"
print(queueString.filter{$0.starts(with: "io") })

//вывести каждый 3й элемент массива
print(queueInt.filterIndex{($0 + 1) % 3 == 0})
print(queueString.filterIndex{($0 + 1) % 3 == 0})

////вывести 1й и последний
print(queueInt.filterIndex{$0 == 0 || $0 == queueInt.count() - 1})
print(queueString.filterIndex{$0 == 0 || $0 == queueString.count() - 1})

//вывести все элементы массива после 4го
print(queueInt.filterIndex{$0 > 4})
print(queueString.filterIndex{$0 > 4})

print(queueString[34])
print(queueInt[3]!)
