//: Playground - noun: a place where people can play

import UIKit

/// Property Observer 属性观察器

///  应用场景 有没有一些方式让灯泡自己发现当前灯泡通过的电流超过了最大负载

class LightBulb{
    static let maxCurrent = 30  ///通过灯泡的最大电流是多少
    
    ///当前通过灯泡的电流
    var current = 0 {
        didSet(oldCurrent){ /// 新的值赋值给current以后，执行的逻辑
            if current == LightBulb.maxCurrent {
                print("Pay attention, the current value get to the maximum point.")
            }
            else if current > LightBulb.maxCurrent{
                print("Current too hight, falling back to previous setting.")
                current = oldCurrent
            }
            print("the current is \(current)")
        }
        
        willSet(newCurrent){ ///在将要赋值之前，执行的逻辑
            print("Current value will change, the change is \(abs(current - newCurrent))")
        }
    }
}


let bulb = LightBulb()
bulb.current = 20
//bulb.current = 30
bulb.current = 40



enum Theme{
    case DayMode
    case NightMode
}

class UI{
    ///这是隐式可选性的重要的应用场景，不希望该属性为nil，但是在初始化UI实例之前，并不清楚themeMode的值，如果不知道themeMode的值就无法确定fontcolor，backgroundColor的值，所以他们暂时为nil,
    var fontColor: UIColor! ///
    var backgroundColor: UIColor!
    /// 在这个应用场景中，一旦改变themeMode，也相应的需要改变fontColor，backgroundColor，于是就用到了属性观察器
    var themeMode: Theme = .DayMode{
        didSet{ /// didset在方法init方法中不会被调用
            self.changeThemeMode(themeMode: themeMode)
        }
    }
    
    init(themeMode:Theme){
        /// didset在方法init方法中不会被调用,包括设置默认值也不会调用
        self.themeMode = themeMode
        self.changeThemeMode(themeMode: themeMode)
    }
    
    func changeThemeMode(themeMode: Theme){
        switch themeMode {
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.white
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.black
        }
    }
}

let ui = UI(themeMode: .DayMode)
ui.fontColor
ui.backgroundColor

ui.themeMode = .NightMode
ui.fontColor
ui.backgroundColor

/**
 以下的定义违背了 ‘应该把结构体看作是值，类看做是物体’的基本原则，
 只是实验这些特性在结构体中的使用,也可以体会在结构体中的不同
 */

struct LightBulbs{
    static let maxCurrent = 30
    var current = 0{
        willSet{
            print("Current value will change, the change is \(abs(current - newValue))")
        }
        didSet{
            if current == LightBulb.maxCurrent {
                print("Pay attention, the current value get to the maximum point.")
            }
            else if current > LightBulb.maxCurrent{
                print("Current too hight, falling back to previous setting.")
                current = oldValue
            }
            print("the current is \(current)")
        }
    }
}

print("**********************************")

var bulbs = LightBulbs()
bulbs.current = 20
//bulb.current = 30
bulbs.current = 40

struct UIS{
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{
        didSet{
            self.changeTheme(themeMode)
        }
    }
    
    init(themeMode:Theme){
        self.themeMode = themeMode
        self.changeTheme(themeMode)
    }
    
    mutating func changeTheme(_ themeMode:Theme){
        switch themeMode {
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.white
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.black
        }
    }
}

var uis = UIS(themeMode: .DayMode)
uis.fontColor
uis.backgroundColor



