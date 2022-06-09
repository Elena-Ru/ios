//
//  Queue.swift
//  6_Русских_Елена
//
//  Created by Елена Русских on 08.06.2022.
//

import Foundation

struct Queue<T>:CustomStringConvertible {
    
    //массив, где будем хранить
     private var elements : [T]  = []
    
    //Добавляем елемент в конец массива
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    //извлекаем первый эл-т из массива
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    //Возвращает элемент, который вернет следующий вызов метода Dequeue. Очередь остается без изменений. Если очередь пустая -> nil
    
    func peek() -> T?{
        return elements.isEmpty ? nil : elements.first
    }
   // Возвращает количество элементов в очереди или 0, если очередь пустая.
    func count() -> Int{
        return elements.isEmpty ? 0 : elements.count
    }
    
    //фильтр по значению
    func filter (predicate: (T) -> Bool) -> [T] {
        var tmpArray = [T]()
        for element in elements {
            if predicate(element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
   }
    
    //фильтр по индексу
    func filterIndex(predicate : (Int) -> Bool) -> [T] {
        var tmpArray = [T]()
        for i in 0...elements.count - 1 {
            if predicate(i) {
                tmpArray.append(elements[i])
            }
        }
        return tmpArray
    }
    
    //3. *Добавить свой subscript, который будет возвращать nil в случае обращения к
    //несуществующему индексу.
    
    subscript (index: Int) -> T?{
        guard (index >= 0 && index < elements.count) else {return nil}
        return elements[index]
    }
    var description: String{
        guard !elements.isEmpty else {return "Очередь пустая."}
        return "Элементы очереди: \(elements)"
    }
}
