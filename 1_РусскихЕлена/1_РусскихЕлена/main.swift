//
//  main.swift
//  1_РусскихЕлена
//
//  Created by Елена Русских on 24.05.2022.
//

import Foundation

//1. Решить квадратное уравнение.
var a: Double
var b: Double
var c: Double
let x1: Double
let x2: Double
var isDouble: Bool = false
var num: Double = 0
var arr: [Double] = [] // массив с коэффициентами уравнения

//Пользователь вводит коэффициенты уравнения
func input(i: Int) -> Double{
  repeat {
    isDouble = false
    print("Введите \(i)й коэффициент квадратного уравнения: ")
    if let j = Double(readLine()!){
       isDouble = true
       num = j
       arr.append(num)
    }
  } while isDouble != true
    return num
}

//Отображаем вид полученного уравнения
func printEquation(array:[Double]) -> String{

    var equation: String = ""
    var sign: String
    for i in 0...array.count-1{
        sign = ""
        guard array[i] != 0  else {continue}
        if array[i] > 0 {
            sign = "+"
        }
        switch i{
        case 0:
           equation += "\(array[i])*x*x"
        case 1:
            equation += "\(sign)\(array[i])*x"
        case 2:
            equation += "\(sign)\(array[i])"
        default:
            break
        }
    }
    equation += " = 0"
    return equation
}

//вводим коэф.
a = input(i: 1)
b = input(i: 2)
c = input(i: 3)

print("Уравнение: \(printEquation(array: arr))")

//Решение
if a == 0 {
    print("Это не квадратное уравнение")
} else{
     let d = b * b - 4 * a * c
    if d < 0 {
            print("Корней нет")
    } else{
         x1 = (-1 * b + sqrt(d)) / (2 * a)
         x2 = (-1 * b - sqrt(d)) / (2 * a)
        if x1 == x2 {
            print("Корень уравнения x = \(x1)")
        } else{
            print("Корни уровнения x1 = \(x1), x2 = \(x2)")
        }
    }
}
//+++++++++++++++++++++++++++++++++++++++
//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var num1: Double = 0
var isDouble1: Bool = false

//Пользователь вводит катет
func input1(i: Int) -> Double{
  repeat {
    isDouble1 = false
    print("Введите \(i)й катет: ")
    if let j = Double(readLine()!) {
        if j > 0{
         isDouble1 = true
         num1 = j
        }
    }
  } while isDouble1 != true
    return num1
}
 
let cat1 = input1(i: 1)
let cat2 = input1(i: 2)

let gip = sqrt(pow(cat1, 2) + pow(cat2, 2))
let perimetr = cat1 + cat2 + gip
let s = (cat1 + cat2) / 2

print("Первый катет: \(cat1)\nВторой катет: \(cat2)")
print("Гипотенуза: \(gip)\nПериметр: \(perimetr)\nПлощадь: \(s)")

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ЗАДАЧА 3
//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var isDouble2: Bool = false
var sumV: Double = 0
var procent: Double = 0
let years: Double = 5
var num3: Double = 0

func input2(str: String) -> Double{
    repeat {
        isDouble2 = false
        print("Введите \(str): ")
        if let j = Double(readLine()!) {
            if j > 0 {
            isDouble2 = true
            num3 = j
            }
        }
    } while isDouble2 != true
    return num3
}

sumV = input2(str: "сумму вклада")
procent = input2(str: "годовой процент")

let sum = sumV * pow(( 1 + (procent/100)), years)
print("Сумма вклада через \(Int(years)) лет = \(sum)")
