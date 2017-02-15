//: Playground - noun: a place where people can play

import UIKit

/**
 和比较相关的协议
 Equatable //遵守这协议后，必须重载==这个运算符
 Comparable //
 */

struct Record: Equatable,Comparable,CustomStringConvertible,ExpressibleByBooleanLiteral{
    public typealias BooleanLiteralType = Bool
    var wins: Int
    var losses: Int
    var description: String{
        return " wins: \(wins) losses: \(losses)"
    }
    
//    public var boolValue: Bool{
//        get{
//            return self.wins  > self.losses
//            
//        }
//    }
    
   static func ==(left:Record,right:Record) -> Bool{
        return left.wins == right.wins && left.losses == right.losses
    }
    
   static func <(left: Record, right: Record) -> Bool{
        if left.wins != right.wins {
            return left.wins < right.wins
        }
        return left.losses > right.losses
    }
    
    init(wins: Int, losses: Int){
        self.wins = wins
        self.losses = losses
    }
    
    init(value: Record) {
        self.wins = value.wins
        self.losses = value.losses
    }
    
    public init(booleanLiteral value: BooleanLiteralType){
        if value {
            self.wins = 1
            self.losses = 0
        }
        else{
            self.wins = 0
            self.losses = 1
        }
    }
}


let record1 = Record(wins: 20, losses: 40)
let record2 = Record(wins: 20, losses: 40)

record1 == record2

record1 != record2

record1 < record2
record1 <= record2
record2 > record2
record2 >= record2


let teamRecord1 = Record(wins: 10, losses: 3)
let teamRecord2 = Record(wins: 8, losses: 5)
let teamRecord3 = Record(wins: 8, losses: 8)

var records = [teamRecord1,teamRecord2,teamRecord3]
records.sorted(by: <)

print(teamRecord3)

//let record3 = Record(booleanLiteral: true)
//if record3 {
//    
//}

extension Int{
    public typealias BooleanLiteralType = Bool
    public var boolValue: Bool{
        get{
            return self != 0
        }
        set{
        }
    }

}

let a = 3
if a.boolValue {
    
}