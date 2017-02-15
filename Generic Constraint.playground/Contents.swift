//: Playground - noun: a place where people can play

import UIKit

/**
 泛型约束
 
 ```
 func topOne(seq:[Comparable]) -> Comparable{
 
 }   ❌
 ```

 ```
 func topOne<T:Comparable>(seq:[T]) -> T{
    assert(seq.count > 0)
    return seq.reduce(seq[0]) { max($0,$1)}
 } ✅
 ```
 
 ```
 func topPrizableOne<T:Comparable & Prizable>(seq:[T]) -> T?{
    return seq.reduce(nil){(temTop: T?, contender: T) -> T? in
        guard contender.isPrizable() else{
            return temTop
        }
        guard let temTop = temTop else{
            return contender
        }
        return max(temTop, contender)
    }
 } ✅
 ```
 
 */


protocol Prizable{
    func isPrizable() -> Bool
}

struct Student: CustomStringConvertible, Equatable,Comparable, Prizable{
    var name: String
    var score: Int
    
    func isPrizable() -> Bool {
        return score > 60
    }
    
    var description: String{
        return "\(name) \(score)"
    }
    
    static func ==(s1: Student, s2: Student) -> Bool{
        return s1.score > s2.score
    }
    
    static func <(s1: Student, s2: Student) -> Bool{
        return s1.score < s2.score
    }
}


let jobs = Student(name: "Steve Jobs", score: 80)
let alice = Student(name: "Alice", score: 90)
let tim = Student(name: "Tim", score: 100)
let ive = Student(name: "Ive", score: 34)

let students = [jobs,alice,tim,ive]
///找到最大的元素
//func topOne(seq:[Comparable]) -> Comparable{
//    
//}
func topOne<T:Comparable>(seq:[T]) -> T{
    assert(seq.count > 0)
    return seq.reduce(seq[0]) { max($0,$1)}
}

    
topOne(seq: students)
///有可能都不可被奖励
func topPrizableOne<T:Comparable & Prizable>(seq:[T]) -> T?{
    return seq.reduce(nil){(temTop: T?, contender: T) -> T? in
        guard contender.isPrizable() else{
            return temTop
        }
        guard let temTop = temTop else{
            return contender
        }
        return max(temTop, contender)
    }
}

print(topPrizableOne(seq: students))


