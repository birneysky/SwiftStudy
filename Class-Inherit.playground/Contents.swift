//: Playground - noun: a place where people can play

import UIKit

/// 继承，结构体不具备

///角色
class Avatar{
    var name: String
    var life: Int =  100
    var isLive: Bool = true
    
    init(name: String){
        self.name = name
    }
    
    func beAttacked(attack: Int){
        life -= attack
        if  life <= 0 {
            isLive = false
        }
    }
}


class User: Avatar{
    var score = 0
    var level = 0
}


let player = User(name: "MMDa")

player.name
player.life
player.isLive
player.score

player.beAttacked(attack: 20)

player.life

///不希望被继承
final class Magician: User{
    var magic = 0
}


let magician = Magician(name: "Harry Potter")
magician.score
magician.level
magician.life
magician.name
