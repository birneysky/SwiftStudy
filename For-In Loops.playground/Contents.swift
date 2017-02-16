//: Playground - noun: a place where people can play

import UIKit

/// 1- 10


for i in 1 ... 10{
    print(i, terminator: " ")
}

print("\n======================")
/// 10-1
for i in (1...10).reversed(){
    print(i, terminator: " ")
}
print("\n======================")
///步长
/// to 不包含 10
for i in stride(from: 0, to: 10, by: 2){
    print(i, terminator: " ")
}

print("\n======================")
///through 包含0
for i in stride(from: 10, through:0, by: -2){
    print(i, terminator: " ")
}

print("\n======================")
///步长
/// to 不包含 10
for i in stride(from: 9, to: 10, by: 0.1){
    print(i, terminator: " ")
}