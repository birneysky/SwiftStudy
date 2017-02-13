//: Playground - noun: a place where people can play

import UIKit

//// 当引入了继承这个概念后，对子类的构造函数有什么影响

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
    ///玩家所在的组
    var group: String
    ///表示这个方法不能覆盖
    final func getScore(score: Int){
        self.score += score
        if score > level *  100{
            level += 1
        }
    }
    
    /// 当所有的属性没有初始化完成时，是不能使用self.来调用成员方法
    init(name:String, group: String){
        ///swift中先初始化子类本身的属性后，才可以初始化父类相关的属性
        self.group = group
        ///swift中父类的属性必须通过父类的构造函数初始化
        super.init(name: name)
        
        //// 进一步完善这个类相关属性的值
        if group == ""{
            self.getScore(score: -10)
        }
        //self.name = name   /// 报错
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
    var weapon: String
    init(name: String, group: String, weapon: String){
        self.weapon = weapon
        super.init(name: name, group: group)
    }
    
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


let user = User(name: "MMDa", group: "imoc")
user

