//: Playground - noun: a place where people can play

import UIKit

protocol Pet{
    var name:String {get set}
}

protocol Flayable{
    var flySpeed: Double {get}
    var flyHeight: Double {get}
}

class Animail{
    
}

class Dog: Animail, Pet{
    var name:String = "Puppy"
}

class Cat: Animail, Pet{
    var name: String = "Kitton"
}

class Bird: Animail,Flayable{

    var flySpeed: Double
    var flyHeight: Double
    
    init(flySpeed: Double, flyHeight: Double){
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
    
}

/// 鹦鹉
class Parrot: Bird,Pet{
    
    var name: String
    init(name: String,flySpeed:Double,flyHeight:Double){
        self.name = "\(name) \(name)"
        super.init(flySpeed: flySpeed, flyHeight: flyHeight)
    }
    
}

/// 麻雀
class Sparrow: Bird{
    var color = UIColor.gray
}

/// 交通工具
class Vehicle{
    
}

class Plane: Vehicle, Flayable{
    var model: String
    var flySpeed: Double
    var flyHeight: Double
    
    init(model: String, flySpeed: Double, flyHeight: Double){
        self.model = model
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
}


var dog = Dog()
var cat = Cat()
var parrot = Parrot(name: "hi", flySpeed: 10.0, flyHeight: 1000)

let pets: [Pet] = [dog,cat,parrot]
for pet in pets {
    print(pet.name,terminator:" ")
}
print()


var sparrow = Sparrow(flySpeed: 15.0, flyHeight: 80)
var plane = Plane(model: "BoIng", flySpeed: 200, flyHeight: 10000)

let flyers: [Flayable] = [sparrow,plane,parrot]

for flyer in flyers {
    print("fly speed: ",flyer.flySpeed, "fly height: ",flyer.flyHeight)
}


