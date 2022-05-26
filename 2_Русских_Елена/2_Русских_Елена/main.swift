//
//  main.swift
//  2_Русских_Елена
//
//  Created by Елена Русских on 25.05.2022.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
print("ЗАДАЧА 1")

let number1: Int = -19

func isEven(number n: Int) -> Bool{
    return( n % 2 == 0 ? true: false)
}

isEven(number: number1) ? print("Число \(number1) является чётным.") : print("Число \(number1) является нечётным.")

//++++++++++++++++++++++++++++++++
//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
//++++++++++++++++++++++++++++++++
print("\nЗАДАЧА 2 ")
let number2 = 11

func isRemainder(number n: Int) -> Bool{
    return( n % 3 == 0 ?  true: false)
}
isRemainder(number: number2) ? print("Число \(number2) делится на 3 без остатка") : print("Число \(number2) не делится на 3 без остатка")

//++++++++++++++++++++++++++++++++
//3. Создать возрастающий массив из 100 чисел.
//++++++++++++++++++++++++++++++++
print("\nЗАДАЧА 3  - 1 способ")
//1й способ

func createArrayGrow (min_number min: Int) -> [Int]{
    
    let arrayGrow : [Int] = Array(min...min + 99)
    return arrayGrow
    
}
print(createArrayGrow(min_number: 21))

print("\nЗАДАЧА 3  - 2 способ")
//2й способ
var arrayGrow: [Int] = []

func createArrayGrowInRange (min_number min: Int, max_number max: Int) -> [Int]{
    for _ in 0..<100{
        arrayGrow.append(Int.random(in: min...max))
    }
    arrayGrow = arrayGrow.sorted()
    return arrayGrow
}
print(createArrayGrowInRange(min_number: 21, max_number: 120))

//++++++++++++++++++++++++++++++++
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
//++++++++++++++++++++++++++++++++
//работаем с массивом arrayGrow из 3й задачи
var arrayGrow1 = arrayGrow // резервная копия для 2го способа 4й задачи
var arrayGrow2 = arrayGrow // резервная копия для 3го способа 4й задачи
var arrayGrow3 = arrayGrow // резервная копия для 4го способа 4й задачи

print("\nЗАДАЧА 4 - 1 способ")
//1й способ

func removeNumber(array ar: inout [Int]) -> [Int]{
  
    ar.removeAll(where: {$0 % 2 == 0 || $0 % 3 != 0})
    return ar
}
print( removeNumber(array: &arrayGrow) )

print("\nЗАДАЧА 4 - 2 способ")
//2й способ

func removeNumber1(array ar: inout [Int]) -> [Int]{
    
    let check = ar.min()! - 1
    
    for i in 0..<ar.count where !(ar[i] % 2 != 0 && ar[i] % 3 == 0){
            ar[i] = check
    }
    ar = ar.filter() {$0 != check}
    return ar
}
print( removeNumber1(array: &arrayGrow1) )

print("\nЗАДАЧА 4 - 3 способ")
//3й способ

func removeNumber2(array ar: inout [Int]) -> [Int]{
    
    let check = ar.min()! - 1
    
    for i in 0..<ar.count where !(ar[i] % 2 != 0 && ar[i] % 3 == 0){
        ar[i] = check
    }
    ar = ar.sorted()
    
    for _ in ar.reversed() where ar.first! == check{
        ar.remove(at: 0)
    }
    return ar
}
print( removeNumber2(array: &arrayGrow2) )

print("\nЗАДАЧА 4 - 4 способ")
//4й способ

var arrayNew : [Int] = []

func removeNumber3(array ar: [Int]) -> [Int]{
    
    for i in ar where i % 2 != 0 && i % 3 == 0{
            arrayNew.append(i)
    }
    return arrayNew
}

print(removeNumber3(array: arrayGrow3))

//++++++++++++++++++++++++++++++++
//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
//++++++++++++++++++++++++++++++++

print("\nЗАДАЧА 5")

var arrayFib: [Int] = []

func addFibonacci(array ar: inout [Int]) -> [Int]{
    
    if ar.count < 2{
        ar.append(1)
    } else{
        ar.append(ar.last! + ar[ar.count-2])
    }
    return ar
}

for _ in (1...50){
    addFibonacci(array: &arrayFib)
    }
print(arrayFib)

//++++++++++++++++++++++++++++++++
//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
//++++++++++++++++++++++++++++++++
print("\nЗАДАЧА 6 - 1й способ")

func isSimple(number num: Int) -> Bool{
   guard num >= 2 else {return false}
    for i in 2 ..< num{
        guard num % i != 0 else {return false}
    }
    return true
}


func fillSet(setCount count: Int) -> Set<Int> {
    
    var setSimple = Set<Int>()
    
    repeat{
        let rand = Int.random(in: 2..<600)
        if isSimple(number: rand) == true {
            setSimple.insert(rand)
        }
    } while setSimple.count < count
    return setSimple
}

print(fillSet(setCount: 100))

print("\nЗАДАЧА 6 - 2й способ")
//2й способ - возрастающий массив с простыми числами, начиная с 2
func fillArray(arrayCount count: Int) -> [Int]{
    var arSimple: [Int] = []
    
    for i in 1...1000{
        guard arSimple.count < count else { return arSimple}
        if isSimple(number: i){
            arSimple.append(i)
        }
    }
    return arSimple
}
print(fillArray(arrayCount: 100))
    
//++++++++++++++++++++++++++++++++
//Поменять значения переменных местами в 1 стрку без исполльзования дополнительной переменной tmp
//++++++++++++++++++++++++++++++++
print("\nДОПОЛНИТЕЛЬНОЕ ЗАДАНИЕ")

var a = 10
var b  = 11
print("Начальное значение переменнойa = \(a)")
print("Начальное значенние переменной b = \(b)")

swap(&a, &b)

print("Итоговое значение переменной a = \(a)")
print("Итоговое значение переменной b = \(b)")
