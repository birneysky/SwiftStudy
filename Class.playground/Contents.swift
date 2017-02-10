//: Playground - noun: a place where people can play

import UIKit


/**
 
如何定义一个类
 
当类中的属性没有初始值,那么必须给该类提供一个构造函数,这里与结构体不同
```
 class Person{
    var firstName: String
    var lastName: String
    init(){
        self.firstName = ""
        self.lastName = ""
    }
 }
```

当属性有初始值时,编译器会提供一个没有参数的构造函数
 ```
 class Person{
     var fistName: String = ""
     var lastName: String = ""
 }
```
 
 
 
```
 class Person{
    var firstName: String
    var lastName: String
 
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
 }
 
 
 let p1: Person = Person(firstName: "Alexander", lastName: "Hamilton")
 
 p1.firstName
 p1.lastName
 p1.fullName()
 
 let p2 = Person(fullName: "Steve Jobs")
 p2?.firstName
 p2?.lastName
 p2?.fullName()
```
 */



class Person{
    var firstName: String
    var lastName: String
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
}


/**
 类是引用类型， 函数和闭包也是引用类型
 
 Reference Type
 */
let person = Person(firstName: "birney", lastName: "zhao", career: "Developer")
let person2 = person

person2.firstName = "Steve"
person2.lastName = "Jobs"
person2.career = "🍎CEO 🐂"

person.firstName
person.lastName
person.career



