//: Playground - noun: a place where people can play

import UIKit

///宠物
///如果希望协议只被类遵守,可以这样定义 protocol Pet: class{}
protocol Pet{
    
    var name:String {get set}
    
    ///属性不可以带默认值
    ///var birthPlace:String = "hello"
    ///  属性也不可以定义为let
    ///let birthPlace:String = "hello"
    var birthPlace:String { get }
    
    func playWith()
    
    func feed(feed: String) -> String
    
    ///不能指定默认参数值，因为默认参数也是一种实现,是协议不允许的
    ///func feed(feed: String = "剩饭") -> String
    
    
    mutating func changeName(newName: String)
    
}


struct  Dog: Pet{
//    private var myDogName: String
//    var name: String{
//        set{
//            myDogName = newValue
//        }
//        
//        get{
//            return myDogName
//        }
//    }
//    
    var name: String = "Puppy"
    
    let birthPlace: String = "beijing"
    
    func feed(feed: String = "剩饭") -> String {
       return feed
    }

    func playWith() {
        
    }

    mutating func changeName(newName: String) {
        self.name = newName
    }
}

class Cat: Pet{
    var name: String = "maomi"
    var birthPlace: String = "chengdu"
    func feed(feed: String) -> String {
        return feed
    }
    
    func playWith() {
        
    }
    
    func changeName(newName: String) {
        self.name = newName
    }
}

let myDog = Dog()
let pet:Pet = myDog



///协议和构造函数