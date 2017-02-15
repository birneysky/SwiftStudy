//: Playground - noun: a place where people can play

import UIKit


/// debug模式下用
//assert(0>1, "Error")
//assert(0>1)
//assertionFailure("Error hello world")


/// release下用

//precondition(0>1)
//precondition(0>1, "Error")
//fatalError()
//fatalError("Error")


Int("xxx")

let range = "Hello".range(of: "e")
range?.upperBound
range?.lowerBound


class VendingMachine{
    struct Item {
        
        enum ItemType: String{
            case Water
            case Cola
            case Juice
        }
        
        let type: ItemType
        let price: Int
        var count: Int
    }
    
    private var items = ["Mineral Water":Item(type: .Water, price: 2, count: 10),
                         "Coca Cola": Item(type: .Cola, price: 3, count: 5),
                         "Orange Juice": Item(type:.Juice, price: 4, count: 8)]
}



