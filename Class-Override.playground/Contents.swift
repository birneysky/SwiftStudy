//: Playground - noun: a place where people can play

import UIKit

///角色
class Avatar{
    var name: String
    var life: Int =  100 {
        didSet{
            if self.life <= 0 {
                self.isLive = false
            }
            if self.life > 100{
                self.life = 100
            }
        }
    }
    
    var isLive: Bool = true
    var description: String{
        return "I'm avatar \(name)"
    }
    
    init(name: String){
        self.name = name
    }
    
    func beAttacked(attack: Int){
        life -= attack
    }
}


class User: Avatar{
    var score = 0
    var level = 0
    
    ///表示这个方法不能覆盖
    final func getScore(score: Int){
        self.score += score
        if score > level *  100{
            level += 1
        }
    }
    
    ///希望再子类中重新定义它，覆盖父类的这个属性
   override var description: String{
        return "I'm user \(name)"
    }
}

///不希望被继承
final class Magician: User{
    var magic = 0
    
    func heal(user: User){
        user.life += 10
        
    }
    
    ///希望再子类中重新定义它，覆盖父类的这个属性
    override var description: String{
        return "I'm Magician \(name)"
    }
}

///战士
final class Warrior: User{
    var weapon: String?
    
    ///希望再子类中重新定义它，覆盖父类的这个属性
    override var description: String{
        return "I'm Warrior \(name)"
    }
    
    override func beAttacked(attack: Int) {
        self.life -= attack / 2
    }
}

/// 怪兽
class Monster: Avatar{
    ///攻击某个用户
    func attack(user: User, amount: Int){
        user.beAttacked(attack: amount)
    }
    ///希望再子类中重新定义它，覆盖父类的这个属性
    override var description: String{
        return "I'm Monster \(name)"
    }
}

/// 僵尸
final class Zombie: Monster{
    var type = "Default"
    ///希望再子类中重新定义它，覆盖父类的这个属性
    override var description: String{
        return "I'm Zombie \(name)"
    }
}



let player1 = Magician(name: "Harry Potter")
let player2 = Warrior(name: "MMDa")

let zombie = Zombie(name: "default zombie")
let monster = Monster(name: "monster")

let avatar:[Avatar] = [player1,player2,zombie,monster];

for a in avatar{
   print(a.description)
}

monster.attack(user: player1, amount: 20)
player1.life
monster.attack(user: player2, amount: 20)
player2.life
