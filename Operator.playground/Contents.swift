//: Playground - noun: a place where people can play

import UIKit

///  运算符重载

struct Vector3{
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0
    
    subscript(index: Int) -> Double?{
        get{
            switch index{
            case 0: return x
            case 1: return y
            case 2: return z
            default: return nil
            }
        }
        
        set{
            guard let  newValue = newValue else { return}
            switch index{
            case 0:  x = newValue
            case 1:  y = newValue
            case 2:  z = newValue
            default: return
            }
        }
    }
    
    subscript(axis: String) -> Double?{
        switch axis{
        case "x", "X": return x
        case "y", "Y": return y
        case "z", "Z": return z
        default: return nil
        }
    }
}

func + (left: Vector3, right: Vector3) -> Vector3{
    return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
}

func - (left: Vector3, right: Vector3) -> Vector3{
    return Vector3(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z)
}

/// 单目运算符， 存在放在操作数的前面还是后面的问题 postfix
prefix func - (vector: Vector3) -> Vector3{
    return Vector3(x: -vector.x, y: -vector.y, z: -vector.z)
}

func * (left: Vector3, right: Vector3) -> Double{
    return left.x * right.x + left.y * right.y + left.z + right.z
}

func * (left: Vector3, alpha: Double) -> Vector3{
    return  Vector3(x: left.x * alpha, y: left.y * alpha, z: left.z * alpha)
}

func * (alpha: Double,left: Vector3) -> Vector3{

    return left * alpha
}

func += ( left: inout Vector3, right: Vector3){
    left = left + right
    
}


/// = 运算符不可以重载，由编译器接管

var va = Vector3(x: 1.0, y: 2.0, z: 3.0)
let vb = Vector3(x: 3.0, y: 4.0, z: 5.0)
let vc = Vector3(x: 9.0, y: 3.0, z: 6.0)

va + vb + vc
va - vb + vc
va * vb
va * 3
3  * va
va += vb

let arr = [1,2,3,4]
arr.reduce(1, *)
arr.reduce(0, +)


