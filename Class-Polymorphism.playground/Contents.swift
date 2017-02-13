//: Playground - noun: a place where people can play

import UIKit

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

///不希望被继承
final class Magician: User{
    var magic = 0
    
    func heal(user: User){
        user.life += 10
        
    }
}

///战士
final class Warrior: User{
    var weapon: String?
}

/// 怪兽
class Monster: Avatar{
    ///攻击某个用户
    func attack(user: User, amount: Int){
        user.beAttacked(attack: amount)
    }
}

/// 僵尸
final class Zombie: Monster{
    var type = "Default"
    
}

let player1 = Magician(name: "Harry Potter")
let player2 = Magician(name: "MMDa")

let zombie = Zombie(name: "default zombie")
let monster = Monster(name: "monster")

func printBasicInfo( avatar: Avatar){
    print("the avatar's name is \(avatar.name)")
    print("the life is \(avatar.life). He is \(avatar.isLive ? "still alive" : "dead")")
    print("==========")
}

printBasicInfo(avatar: player1)
printBasicInfo(avatar: player2)
printBasicInfo(avatar: zombie)
printBasicInfo(avatar: monster)


let avatar:[Avatar] = [player1,player2,zombie,monster];

for a in avatar{
    a.life -= 10
}


