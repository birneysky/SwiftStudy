//: Playground - noun: a place where people can play

import UIKit

/// NSObject AnyObject Any


var objects1: NSArray = [
    CGFloat(3.1415926),
    "IMOC",
    UIColor.white,
    NSDate(),
    Int(32),
    Array<Int>([1,2,3])
]


let a = objects1[0]
let b = objects1[1]

var objects2:[Any] = [
    CGFloat(3.1415926),
    "IMOC",
    UIColor.white,
    NSDate(),
    Int(32),
    Array<Int>([1,2,3])
]

let c = objects2[0]
let d = objects2[1]
objects2.append({(a: Int) -> Int in
    return a * a
})

var object3:[AnyObject] = [ UIColor.white, NSDate()]

