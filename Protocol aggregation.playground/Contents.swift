//: Playground - noun: a place where people can play

import UIKit

/**
协议聚合 
 
 
 同时遵守多个协议
 
 ```
 Prizable & CustomStringConvertible ///swift 3
 
 func award(one: Prizable & CustomStringConvertible){
    if one.isPrizable() {
        print(one)
        print("Congratulation! You Won a prize")
    }
    else{
        print("You can not have the prize")
    }
 }
 
 ```
 ```
 protocol<Prizable,CustomStringConvertible> ///wift 2
 
 ```
 
*/

protocol Record: CustomStringConvertible{
    var wins: Int {get}
    var losses: Int {get}
}

protocol Tieable{
    var ties: Int {get set}
}

///可奖励的协议
protocol Prizable{
    func isPrizable() -> Bool
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

struct BasketballRecord: Record,Prizable{
    var wins: Int
    var losses: Int
    
    func isPrizable() -> Bool {
        return wins > 2
    }
}


struct BaseballRecord: Record,Prizable{
    var wins: Int
    var losses: Int
    let gamePlayed: Int = 162
    
    func isPrizable() -> Bool {
        return gamePlayed > 10 && winningPercent() > 0.5
    }
}

struct FootballballRecord: Record,Tieable,Prizable{
    var wins: Int
    var losses: Int
    var ties: Int ///平局
    
    func isPrizable() -> Bool {
        return wins > 1
    }
}

struct Student: Prizable,CustomStringConvertible{
    var name: String
    var score: Int
    
    func isPrizable() -> Bool {
        return score > 60
    }
    
    var description: String{
        return "\(name) \(score)"
    }
}

///颁奖   协议的聚合//同时遵守多个协议
func award(one: Prizable & CustomStringConvertible){
    if one.isPrizable() {
        print(one)
        print("Congratulation! You Won a prize")
    }
    else{
        print("You can not have the prize")
    }
}

let basketBallRecord = BasketballRecord(wins: 10, losses: 5)
let baseBallRecord = BaseballRecord(wins: 8, losses: 3)
let footballRecord = FootballballRecord(wins: 1, losses: 1, ties: 1)
//print(baseBallRecord)
//print(basketBallRecord)
//baseBallRecord.shoutWins()
baseBallRecord.descriptionWithDate


baseBallRecord.gamePlayed
footballRecord.gamePlayed
footballRecord.winningPercent()

award(one: basketBallRecord)

let jobs = Student(name: "Steve Jobs", score: 61)
award(one: jobs)
