//: Playground - noun: a place where people can play

import UIKit


protocol Pet{
    
    var name:String {get set}

    init(name: String)
    
    func playWith()
    
    func feed()

}


class Animail{
    ///哺乳类动物
    var type: String = "mammal"
    
}

///父类必须放在冒号的第一个位置
 class Dog: Animail, Pet{
   
    var name:String = "Puppy"
    
    func playWith(){
        print("wang")
    }
    
    func feed(){
        print("I love meat")
    }
    
    required init(name: String) {
        self.name = name
    }
}


class Bird: Animail{
    
    var name: String = "Little Little Bird"
    
    init(name: String){
        self.name = name
    }
    
}

/// 鹦鹉
class Parrot: Bird,Pet{
    
    required override init(name: String) {
        super.init(name: name + " " + name )
    }
    
    func playWith(){
        
    }
    
    func feed(){
        
    }

}


