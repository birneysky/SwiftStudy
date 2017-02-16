//: Playground - noun: a place where people can play

import UIKit

protocol Shape{
    var name: String {get}
}

protocol HasArea{
    func area() -> Double
}


struct Point: Shape{
    let name: String = "point"
    var x: Double
    var y: Double
}

struct Rectangle: Shape, HasArea{
    
    let name: String = "rectangle"
    var origin: Point
    var width: Double
    var height: Double
    
    func area() -> Double {
        return self.width * self.height
    }
}


struct Circle: Shape, HasArea{
    let name: String = "circle"
    var center: Point
    var radius: Double
    
    func area() -> Double {
        return M_PI * self.radius * self.radius
    }
    
}

struct Line: Shape{
    let name: String = "line"
    var a: Point
    var b: Point
}


/**
 判断遵守协议
 */

let shapes: [Shape] = [Rectangle(origin: Point(x: 0, y: 10), width: 20, height: 30),
                       Point(x: 0.0, y: 0.0),
                       Circle(center: Point(x: 0.0, y: 0.0),radius:5),
                       Line(a: Point(x:0, y: 0), b: Point(x: 8, y: 0))]

for shape in shapes {
    ///判断对象是否遵守 HasArea 协议
    if shape is HasArea{
        print("\(shape.name) has area")
    }
    else {
        print("\(shape.name) has no area")
    }
}

print("================")

for shape in shapes {
    if let areaShape = shape as? HasArea{
        print("the area of \(shape.name) is \(areaShape.area())")
    }
    else{
        print("\(shape.name) has no area")
    }
}