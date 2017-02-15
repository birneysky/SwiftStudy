//: Playground - noun: a place where people can play

import UIKit

///交换两个整数

func swapTwoInt(_ a: inout Int, _ b: inout Int){
    (a, b) = (b, a)
}

var a = 0
var b = 6
swapTwoInt(&a, &b)
a
b

///泛型函数

func swapTwoThings<T>(_ a: inout T, _ b: inout T){
    (a,b) = (b,a)
}


swapTwoThings(&a, &b)
a
b
var hello = "hello"
var bye = "bye"

swapTwoThings(&hello, &bye)
hello
bye


/// 泛型类型

let arr:Array<Int> = Array<Int>()
let dic = Dictionary<String, Int>()
let set = Set<Float>()

struct Stack<T>{
    
    var items = [T]()
    
    func  isEmpty() -> Bool{
        return items.count == 0
    }
    
    mutating func push(item: T){
        items.append(item)
    }
    
    mutating func pop() -> T?{
        guard !self.isEmpty() else{
            return nil
        }
        
        return items.removeLast()
    }
}

extension Stack{
    func top() -> T?{
        return items.last
    }
}

var s = Stack<Int>()
s.push(item: 2)
s.push(item: 3)
s.pop()
s.items
s.top()

let sss = Stack<String>()
sss.top()


struct Pair<T1,T2>{
    var a: T1
    var b: T2
    
    
}


var pair = Pair<Int,String>(a: 3, b: "hello")
pair.a
pair.b

