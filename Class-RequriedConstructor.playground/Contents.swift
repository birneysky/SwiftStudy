//: Playground - noun: a place where people can play

import UIKit

/**
 如果希望所有子类都必须实现某一个构造函数，需要在该构造方法前加 'Required'关键字
 */

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
    
    required init(name: String){
        self.name = name
    }
    
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
    var group: String

    final func getScore(score: Int){
        self.score += score
        if score > level *  100{
            level += 1
        }
    }
    
    init(name:String, group: String){
        self.group = group
        super.init(name: name)
        if group == ""{
            self.getScore(score: -10)
        }
    }

    convenience init(group: String){
        let userName = User.generateUserName()
        self.init(name:userName,group:group)
    }
    
///  由于required 要求子类必须实现，所以override关键字变得没有意义了
///     convenience override init(name: String){
///        self.init(name: name, group: "")
///    }
    
    convenience required init(name: String){
        self.init(name: name, group: "")
    }
    
    
    override var description: String{
        return "I'm user \(name)"
    }
    
    static func generateUserName() -> String{
        return "player\(arc4random() % 1_000_000)";
    }
}


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
    
    override var description: String{
        return "I'm Magician \(name)"
    }
}

final class Warrior: User{
    static let weapons = ["Sword","Axe","Spear"]
    var weapon: String
    
    init(name: String, group: String, weapon: String = "Sword"){
        self.weapon = weapon
        super.init(name: name, group: group)
    }
    
    override init(name: String, group: String) {
        self.weapon = Warrior.weapons[Int(arc4random() % 3)]
        super.init(name: name, group: group)
    }
    

    
    override var description: String{
        return "I'm Warrior \(name)"
    }
    
    override func beAttacked(attack: Int) {
        self.life -= attack / 2
    }
}


class Monster: Avatar{

    func attack(user: User, amount: Int){
        user.beAttacked(attack: amount)
    }
    
    convenience init(type: String){
        self.init(name: type)
    }
    
    override var description: String{
        return "I'm Monster \(name)"
    }
}


final class Zombie: Monster{
    var type = "Default"
    override var description: String{
        return "I'm Zombie \(name)"
    }
}


class NPC: Avatar{
    let career: String
    
    init(name: String, career: String){
        self.career = career
        super.init(name: name)
    }
    
    required convenience init(name: String) {
        self.init(name:name, career:"")
    }
}

let  player1 = User(firstName: "Json", lastName: "Snow")
//let  user2 = Monster(



///结构体   

struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var width = 0.0
    var height = 0.0
}

struct Rectangle{
    var origin = Point()
    var size = Size()

    var center:Point{
        get{
            let centerx =  self.origin.x + self.size.width / 2
            let centery =  self.origin.y + self.size.height / 2
            return Point(x: centerx, y: centery)
        }

        set{
            self.origin.x = newValue.x - self.size.width / 2
            self.origin.y = newValue.y - self.size.height / 2
        }
        
    }
    
    var area:Double{
        return size.width * size.height
    }
    
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size){
        let originx = center.x - size.width / 2
        let originy = center.y - size.height / 2
        self.init(origin:Point(x: originx, y: originy),size:size)
    }
}



