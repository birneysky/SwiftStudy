//: Playground - noun: a place where people can play

import UIKit

//// 延迟属性

class  ClosedRange {
    let start: Int
    let end: Int
    
    var width: Int{
        return self.end - self.start + 1
    }
    
    /// 闭区间中所有的元素的和，大多数情况不用，用的场合比较少，
    /// 在初始化时，可以初始化这样一个属性，问题是大多数情况下不用sum，所以初始化sum有些浪费
    /// 可以使用计算属性，问题是每次使用都要再计算一次
    /// 为了解决这些问题，swift开发了延迟属性，希望这个sum在使用时只计算一次，计算完之后就把结果存储在sum中，下次再使用时直接返回结果
    lazy var sum: Int = { /// Int不可以省略，var 不可以写成 let，必须使用var
        print("start computing sum value")
        var  res = 0
        for i in self.start...self.end{///由于延迟属性的大括号是一个闭包，所以start和end需要指明他的所属作用域
            res += i
        }
        return res
    }()
    
    init?(start: Int, end: Int){
        guard end >= start else {
            return nil;
        }
        self.start = start
        self.end = end
    }
}


if let range = ClosedRange(start:0, end:10_000) {
    range.width
    range.sum
    range.sum = 100
    range.sum
    range.sum
}


///  延迟属性 适用的情况还是比较多的

class Location{
    let latitude: Double
    let longitude: Double
    lazy var address: String? = {
        return nil
    }()
    
    init(latitude: Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}

class Book{
    let name:String
    lazy var content: String? = {
        return nil
    }()
    
    init(name:String){
        self.name = name
    }
}

class Web{
    let  url:String
    lazy  var html:String? = {
        return nil
    }()
    
    init(url:String){
        self.url = url
    }
}



/// 使用struct 定义 ClosedRange

struct ClosedRanges{
    let start: Int
    let end: Int
    var width: Int{
       return  self.end - self.start + 1
    }
    
    lazy var sum: Int = {
        var res = 0
        for i in self.start...self.end{
            res += i
        }
        return res
    }()
    
    init?(start: Int, end: Int){
        guard end >= start else {
            return nil
        }
        
        self.start = start
        self.end = end
    }
    
    
}

let ranges = ClosedRange(start: 0, end: 10_000)

ranges?.sum
ranges?.sum = 100
ranges?.sum
ranges?.width
