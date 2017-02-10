//: Playground - noun: a place where people can play

import UIKit


/**
 类实例判断相等

 ```
 let person1 = Person(firstName: "Steve", lastName: "Jobs", career: "CEO")
 let person2 = person1
 person1 == person2  ⛔️🚫
 
 swift中 不能使用== 操作符来判断引用类型相等
 
 “==”的本质是进行值得比较，所以只可以用来进行值类型之间比较，
 
 如果必须要使用需要重载==运算符
 
 ```
 
 对于类的两个实例存在一种判断就是，person1和person2是不是引用同一块内存空间，对于这判断使用"==="来判断
 ```
 person1 === person2  ✅
 person1 !== person2
 ```
 
*/

class Person{
    let firstName: String
    let lastName: String
    var career: String?
    
    init(firstName: String, lastName:String, career: String){
        self.firstName = firstName
        self.lastName = lastName
        self.career = career
    }
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    /// Jobs Steve
    init?(fullName: String){
        guard let spaceIndex = fullName.range(of: " ") else{
            return nil
        }
        
        self.firstName = fullName.substring(to: spaceIndex.lowerBound)
        self.lastName = fullName.substring(from: spaceIndex.upperBound)
    }
    
    func fullName() -> String{
        return "\(self.firstName) \(self.lastName)"
    }
    
    func changeCareer(newCareer: String){
        self.career = newCareer
    }
}

let person1 = Person(firstName: "Steve", lastName: "Jobs", career: "CEO")
let person2 = person1
person1 === person2

let person3 = Person(firstName: "Steve", lastName: "Jobs", career: "CEO")

person2 === person3
person3 !== person2
