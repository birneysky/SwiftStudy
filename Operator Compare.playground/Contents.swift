//: Playground - noun: a place where people can play

import UIKit

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

func == (left: Vector3, right: Vector3) -> Bool{
    return left.x == right.x && left.y == right.y && left.z == right.z
}

func != (left: Vector3, right: Vector3) -> Bool{
    return !(left == right)
}

func < (left: Vector3, right: Vector3) -> Bool{
    if left.x != right.x { return left.x < right.x}
    if left.y != right.y { return left.y < right.y}
    if left.z != right.z { return left.z < right.z}
    
    
    return false
}

func <= (left: Vector3, right: Vector3) -> Bool{
    return left < right || left == right
}

func > (left: Vector3, right: Vector3) -> Bool{
    return !(left <= right)
}


func >= (left: Vector3, right: Vector3) -> Bool{
    return left > right || left == right
}

var va = Vector3(x: 1.0, y: 2.0, z: 3.0)
let vb = Vector3(x: 3.0, y: 4.0, z: 5.0)
let vc = Vector3(x: 9.0, y: 3.0, z: 6.0)

va == vb
va != vb

va < vb
va > vb
va <= vb
va >= vb


/// 比较运算符可以应用在排序上

let a = [3,2,9,1,0]
a.sorted()
a.sorted {$0>$1}
a.sorted(by: <)

