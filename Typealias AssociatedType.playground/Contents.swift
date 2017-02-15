//: Playground - noun: a place where people can play

import UIKit

/**
 类型别名(typealias)和关联类型(associatedtype)
 */



/// 给类型起别名，作用:明确表意
typealias Length = Double

extension Double{
    var km: Length {return self * 1000}
    var m: Length {return self}
    var cm: Length {return self / 100}
    var ft: Length {return self / 3.28084} ///英尺
}


let runningDistance: Length = 3.54.km
let m: Length = 3.m
let cm: Length = 3.cm
let ft: Length = 100.ft


//// 作用：系统兼容性
typealias AudioSample = UInt64 /// UInt8 UInt16  不同系统下使用不同类型整数，程序代码中均使用 AudioSample


protocol WeightCalculable{
    
    ///关联类型
    associatedtype WeightType
    
    var weight: WeightType  {get}
}

class iPhone7:WeightCalculable{
    
    typealias WeightType = Double
    
    var  weight: WeightType {
        return 0.114
    }
}

class Ship: WeightCalculable{
    typealias WeightType = Int
    
    let weight: Int
    
    init(weight: Int) {
            self.weight = weight
    }
}

extension Int{
    typealias Weight = Int
    var t: Weight { return self * 1_000}
}
///重量 4万6千多吨
let titanic = Ship(weight: 46_328_000.t)
