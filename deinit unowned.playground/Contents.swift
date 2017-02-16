//: Playground - noun: a place where people can play

import UIKit

class Person{
    var name: String
    var creditCard: CreditCard?
    
    init(name: String){
        self.name = name
    }
    
    func doSomething(){
        print(self.name,"is doing somthing")
    }
    
    deinit {
        print("\(self.name) is leaving")
    }
}


class CreditCard{
    let number: String
    ///unowned 和  weak 几乎一样，unowned 可以使常量类型，变量必须不是可选型，修饰的变量不许为nil
    unowned let customer: Person
    
    init(number: String, customer: Person) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
       print("creditCard will destory")
    }
}


func inTheStore(){
    print("Welcom to apple store")
    print("=======================")
    
    for _ in 0..<3{
        let jobs: Person? = Person(name: "Steve Jobs")
        jobs?.doSomething()
    }
}

//inTheStore()

var jobs: Person? = Person(name: "Steve Jobs")
var goldenCard: CreditCard? = CreditCard(number: "12345678", customer: jobs!)
jobs?.creditCard = goldenCard

jobs = nil
goldenCard?.customer ///必须得保证unowned修改的变量，不可以提前释放
goldenCard = nil
