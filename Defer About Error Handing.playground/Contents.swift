//: Playground - noun: a place where people can play

import UIKit

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
        ///当前作用域推出时，执行
        defer{///  控制转移 ，有点像goto
            print("Have a nice Day")
        }
        
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
        
        /// 多个defer时，倒序执行
        defer{
           print("Thank you")
        }
        
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
var pocketMoney = 3

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