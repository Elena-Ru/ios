//
//  Purchase.swift
//  7_Русских_Елена
//
//  Created by Елена Русских on 10.06.2022.
//

import Foundation

class Purchase {
    
    var shoppingList =  [
        "Картофель": 1,
        "Яблоки": 2,
        "Морковь": 5
    ]
    
    var newKeyShoppingList = ""
    var newValueShoppingList = 0
   
    func addToShoppingList (key : String, value: Int) throws {
        guard value > 0 else {
            throw ErrorShoppingList.invalidValue
        }
        guard key.count > 0 else {
            throw ErrorShoppingList.invalidKeyValue
        }
        newKeyShoppingList = key
        newValueShoppingList = value
        shoppingList[key] = value
    }
    
    func removeFromShoppingList (key: String, value: Int) throws {
        newKeyShoppingList = key
        newValueShoppingList = value
        guard shoppingList.count > 1 else {
            throw ErrorShoppingList.removingFromEmptyList
        }
        guard shoppingList[key] != nil else{
            throw ErrorShoppingList.noSuchValue
        }
        guard shoppingList[key]! >= value, value > 0 else {
            throw ErrorShoppingList.invalidValue
        }
        self.shoppingList[key] = self.shoppingList[key]! - value
        print(self.shoppingList[key])
    }
    
    
    
//    func addShoppingList (key : String, value: Int) -> ([String : Int]?, ErrorShoppingList?) {
//        guard value > 0 else {
//            return (nil, ErrorShoppingList.invalidValue)
//        }
//        guard key.count > 0 else {
//            return (nil, ErrorShoppingList.invalidValue)
//        }
//        shoppingList[key] = value
//        return ([key: value], nil)
//    }
    
}
