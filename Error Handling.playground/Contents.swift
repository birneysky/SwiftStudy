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
    
    enum ErrorType: Error,CustomStringConvertible{
        case NoSuchItem
        case NotEnoughMoney(Int)
        case OutOfStock
        
        var description: String{
            switch self {
            case .NoSuchItem: return "No Such Item"
            case .NotEnoughMoney(let price): return "Not Enough Money. \(price) Yuan needed"
            case .OutOfStock: return "Out Of Stock"
            }
        }
    }
    
    
    private var items = ["Mineral Water":Item(type: .Water, price: 2, count: 10),
                         "Coca Cola": Item(type: .Cola, price: 3, count: 5),
                         "Orange Juice": Item(type:.Juice, price: 4, count: 8)]

    func vend(itemName: String, money: Int) throws -> Int {
        guard let item = self.items[itemName] else{
            throw ErrorType.NoSuchItem
        }
        
        guard money >= item.price else {
            throw ErrorType.NotEnoughMoney(item.price)
        }
        
        guard item.count > 0 else {
            throw ErrorType.OutOfStock
        }
        
        dispenseItem(itemName: itemName)
        
        return money - item.price
    }
    
    /// 商品的分发
    private func dispenseItem(itemName: String) {
        self.items[itemName]!.count -= 1
        print("Enjoy your", itemName)
    }
    
    func display(){
        print("Want someting to drink ?")
        for itemName in items.keys{
            print("*",itemName)
        }
        print("===================")
    }
}

let vendingMachine = VendingMachine()
vendingMachine.display()

var pocketMoney = 4


//try  vendingMachine.vend(itemName: "Cocas Cola", money: pocketMoney)

//try!  vendingMachine.vend(itemName: "Cocas Cola", money: pocketMoney)

//try?  vendingMachine.vend(itemName: "Coca Cola", money: pocketMoney)

do{
     pocketMoney = try vendingMachine.vend(itemName: "Coca Cola", money: pocketMoney)
     print(pocketMoney, "You Left")
}
//catch {
//   print("Error Occured during Vending")
//}
catch VendingMachine.ErrorType.NotEnoughMoney (let price){
    print("Not enough money",price,"Yuan needed")
}
catch VendingMachine.ErrorType.NoSuchItem{
    print("No such item")
}
catch VendingMachine.ErrorType.OutOfStock{
    print("Out of Stock")
}
catch {
    print("Error Occured during Vending")
}

do{
    pocketMoney = try vendingMachine.vend(itemName: "Coca Cola", money: pocketMoney)
    print(pocketMoney, "You Left")
}
catch let error as VendingMachine.ErrorType{
    print(error)
}
catch {
    print("Error Occured during Vending")
}

