//: Playground - noun: a place where people can play

import UIKit

protocol Record: CustomStringConvertible{
    var wins: Int {get}
    var losses: Int {get}
    func winningPercent() -> Double
}

///协议的扩展中可以对方法进行具体的实现，swift中管这个叫做default implemtation
/// 不仅可以实现自己定义的方法和属性，也可以实现父协议中的方法和属性,也可以在扩展中实现新的方法
extension Record{
    
    func winningPercent() -> Double {
        return Double(wins) / Double(losses)
    }
    
    var description: String{
        return String(format: "Wins: %d, Losses: %d,", wins,losses)
    }
    
    func shoutWins(){
        print("We Win",wins,"Times")
    }
}

extension CustomStringConvertible{
    var descriptionWithDate: String{
        return NSDate().description + " " + description
    }
}

struct BasketballRecord: Record{
    var wins: Int
    var losses: Int
}


struct BaseballRecord: Record{
    var wins: Int
    var losses: Int
}



let basketBallRecord = BasketballRecord(wins: 10, losses: 5)
let baseBallRecord = BaseballRecord(wins: 8, losses: 3)
print(baseBallRecord)
print(basketBallRecord)
baseBallRecord.shoutWins()
baseBallRecord.descriptionWithDate
