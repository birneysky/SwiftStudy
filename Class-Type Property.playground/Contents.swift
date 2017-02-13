//: Playground - noun: a place where people can play

import UIKit


/// Type Property

Int.max
Int.min


class Player{
    var name: String
    var socre = 0
    static var highestScore = 0 /// 全体player使用同一个最高分，该属性应该定义在Player这个类型上，而不是每一个player的实例上
    
    init(name: String){
        self.name = name
    }
    
    func play(){
        let score = Int(arc4random() % 100)
        print("\(name) played and got \(score) scores")
        
        self.socre += score
        print("Total score of \(name) is \(self.socre).")
        
        if self.socre > Player.highestScore {
            Player.highestScore = self.socre
        }
        
        print("Highest score is \(Player.highestScore)")
        
    }
}


let player1 = Player(name: "player1")
let player2 = Player(name: "player2")

player1.play()
player1.play()

player2.play()

/// 注意在结构体上的变化
struct Players{
    var name: String
    var score = 0
    static var highestScore = 0
    
    init(name: String) {
        self.name = name
    }
    
    mutating func play(){
        let score = Int(arc4random() % 100)
        print("\(name) played and got \(score) scores")
        
        self.score += score
        print("Total score of \(name) is \(self.score)")
        
        if self.score > Players.highestScore {
            Players.highestScore = self.score
        }
        
        print("Highest score is \(Player.highestScore)")
        
    }
}


var player1s = Players(name: "player1s")
var player2s = Players(name: "player2s")

player1s.play()
player1s.play()
player1s.play()
//
player2s.play()
