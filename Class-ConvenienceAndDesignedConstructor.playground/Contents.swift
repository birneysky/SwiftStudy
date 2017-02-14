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
    
    ///指定构造函数  designed
    init(name: String){
        self.name = name
    }
    
    ///便利构造函数， 调用指定构造函数,便利构造函数式不允许调用父类的构造函数的
    convenience init(firstName: String, lastName: String){
        let fullName = "\(firstName) \(lastName)"
        self.init(name:fullName)
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
    
    /// 当所有的属性没有初始化完成时，是不能使用self.来调用成员方法的
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
    
    ///便利构造函数,调用了自己的非便利构造函数
    convenience init(group: String){
        let userName = User.generateUserName()
        
        self.init(name:userName,group:group)
    }
    
    ///希望再子类中重新定义它，覆盖父类的这个属性
    override var description: String{
        return "I'm user \(name)"
    }
    
    static func generateUserName() -> String{
        return "player\(arc4random() % 1_000_000)";
    }
}

///不希望被继承,魔术师
final class Magician: User{
    var magic: Int = 0
    
    func heal(user: User){
        user.life += 10
        
    }
    
    
    override init(name: String, group: String) {
        let defaultGroups = ["Gryffindor","Hufflepuff","Ravenclaw","Slytherin"]
        for theGroup in defaultGroups{
            if theGroup == group {
                super.init(name: name, group: group)
                return;
            }
        }
        
        let group = defaultGroups[Int(arc4random() % 4)]
        super.init(name: name, group: group)
    }
    
    ///希望再子类中重新定义它，覆盖父类的这个属性
    override var description: String{
        return "I'm Magician \(name)"
    }
}

///战士
final class Warrior: User{
    static let weapons = ["Sword","Axe","Spear"]
    var weapon: String
    
    ///默认参数
    init(name: String, group: String, weapon: String = "Sword"){
        self.weapon = weapon
        super.init(name: name, group: group)
    }
    
    override init(name: String, group: String) {
        
        self.weapon = Warrior.weapons[Int(arc4random() % 3)]
        super.init(name: name, group: group)
    }
    
    
    //    convenience override init(name: String, group: String) {
    //        let weapon = Warrior.weapons[Int(arc4random() % 3)]
    //        self.init(name: name,group: group, weapon:weapon)
    //    }
    
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


let  player1 = Warrior(name: "MemeDa", group: "Imod")
player1.weapon
