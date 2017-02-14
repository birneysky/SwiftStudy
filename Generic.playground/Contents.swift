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