//: Playground - noun: a place where people can play

import UIKit


/**
 当把Person 类中的fistName，lastName 定义为常量时
 ```
 class Person{
    let firstName: String
    let lastName: String
    var career: String?
 }
 
 let person = Person(firstName: "Steve", lastName: "Jobs", career: "CEO")
 person.firstName = "alex" ///发生错误，person,firstName是常量，不可以修改
 person.career = "Teacher" /// career是可以修改的，这一点与struct是不同的，
 ///如果Person是用struct定义的，由于`person`为常量，即使career是变量依然是不能修改的
 ```
 
由于class是引用类型的，那么let person是对一个Person实例变量的引用，相当于c++中指针，
let person 表示person这个引用变量只可以引用当前实例化的Person实例，不可以引用其他的Person实例
因此person本身不可以修改，person.career是可以修改的，因为这相当于修改的person引用的内存空间的值。

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

let person = Person(firstName: "Steve", lastName: "Jobs", career: "CEO")
person.changeCareer(newCareer: "Teacher")
person.career

/**
 由于Location是一个值类型，每一次变化其实都是产生一个新的值(产生新的副本)，
 mutating 告诉编译器这个方法要自己修改自己，修改完成后把原先的值覆盖掉
 */
struct Location{
    var x = 0
    var y = 0
    
    mutating func goEast() {
        self.x += 1
    }
}
var location = Location()
location.goEast()
location.x


///枚举，改变自身

enum Switch{
    case On
    case Off
    
    mutating func click(){
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var button = Switch.On
button.click()
button

