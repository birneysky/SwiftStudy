//: Playground - noun: a place where people can play

import UIKit


/**
 swift 是一个重度依赖协议的语言
 
 swift 标准库中
 
 Class 6
 
 Enum  8
 
 Structs 103
 
 Protocol 86
 
 */

protocol Record: CustomStringConvertible{
    var wins: Int {get}
    var losses: Int {get}
}

protocol Tieable{
    var ties: Int {get set}
}



extension Record{

    
    var description: String{
        return String(format: "Wins: %d, Losses: %d,", wins,losses)
    }
    
    func shoutWins(){
        print("We Win",wins,"Times")
    }
    
    var gamePlayed: Int{
        return wins + losses
    }
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
    }
    
}

///大写的Self 表示这个类型，这个表示要扩展的遵守Record的类型本身，于此同时这个类型本身也遵守了 Tieable
extension Record where Self: Tieable{
    
    var gamePlayed: Int{
        return wins + losses + ties
    }
    
    func winningPercent() -> Double {
        return Double(wins) / Double(gamePlayed)
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
    let gamePlayed: Int = 162
}

struct FootballballRecord: Record,Tieable{
    var wins: Int
    var losses: Int
    var ties: Int ///平局
}


let basketBallRecord = BasketballRecord(wins: 10, losses: 5)
let baseBallRecord = BaseballRecord(wins: 8, losses: 3)
let footballRecord = FootballballRecord(wins: 1, losses: 1, ties: 1)
print(baseBallRecord)
print(basketBallRecord)
baseBallRecord.shoutWins()
baseBallRecord.descriptionWithDate


baseBallRecord.gamePlayed
footballRecord.gamePlayed
footballRecord.winningPercent()
