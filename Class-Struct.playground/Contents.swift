//: Playground - noun: a place where people can play

import UIKit

/**
 什么时候使用结构体，是什么时候使用类呢
 
 这是一个非常开放的问题，不同的人有不同的答案
 
 简单的指导原则  
 
 1. 应该把结构体看作是值，类看做是物体
    值(经纬度，二维坐标，三维坐标，温度)，物体(人，车，动物，商店)
 
 2, 修改时不希望产生副本时，也使用类
 
 3，类是可以被继承的，需要继承时可以考虑使用类
 
 4，结构体比类更加轻量级
 
 
 */

class Person{

}


/**
 类的计算属性,结构体也适用
 */

struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var width = 0.0
    var height = 0.0
}

class Rectangle{
    var origin = Point() ///存储型属性
    var size = Size()
    /**
     center 的值跟origin和size是相关，对于这种依赖其他属性而存在的属性，swift称它为计算属性。
     对于计算属性，他只能声明为var ，应该他的值是依赖其他属性计算出来的，他的值随时都会改变
     计算型属性也必须显示的声明它的类型
     */
    var center:Point{ ///长方形正中心的点，
        get{ ///属性获取时执行的逻辑
            let centerx =  self.origin.x + self.size.width / 2
            let centery =  self.origin.y + self.size.height / 2
            return Point(x: centerx, y: centery)
        }
//        set(newCenter){/// 赋值时执行的逻辑，本身不能存储值，所以需要将传给center的值，以某种方式转移到存储型属性中
//            self.origin.x = newCenter.x - self.size.width / 2
//            self.origin.y = newCenter.y - self.size.height / 2
//        }
        set{/// 赋值时执行的逻辑，本身不能存储值，所以需要将传给center的值，以某种方式转移到存储型属性中
            self.origin.x = newValue.x - self.size.width / 2
            self.origin.y = newValue.y - self.size.height / 2
        }

    }
    
    var area:Double{ ///只有get的计算属性
        return size.width * size.height
    }

    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
}

let rect = Rectangle(origin: Point(), size: Size(width: 10, height: 5))
rect.center

rect.origin = Point(x: 10, y: 10)
rect.center
rect.center = Point()
rect.origin

/**
对于上面的计算属性的功能，其实也是可以用方法来实现，那么究竟该使用哪一种呢？
对于这个例子应该更倾向于定义为属行。
因为方法通常描述的是一个动作，而属性描述的是事物本身内部的一个特征。  
所以从设计的角度来说，无论是area，还是center，都应该被定义为一个属性。
又由于area，和center 都依赖于origin size属性，所以把他们定义为计算属性。
*/

let rect2 = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 50))
rect2.origin
rect2.isEmpty