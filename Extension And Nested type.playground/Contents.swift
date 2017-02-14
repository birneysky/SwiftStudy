//: Playground - noun: a place where people can play

import UIKit



struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var width = 0.0
    var height = 0.0
}

class Rectangle{
    var origin = Point()
    var size = Size()

    var area:Double{ ///只有get的计算属性
        return size.width * size.height
    }
    
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
}

/// extension 和 oc中的category概念类似


extension Rectangle{
    ///平移
    func translate(x: Double, y: Double){
        self.origin.x += x
        self.origin.y += y
    }
}


///不能扩展存储属性
extension Rectangle{
    
    var center:Point{
        get{
            let centerx =  self.origin.x + self.size.width / 2
            let centery =  self.origin.y + self.size.height / 2
            return Point(x: centerx, y: centery)
        }
        set{
            self.origin.x = newValue.x - self.size.width / 2
            self.origin.y = newValue.y - self.size.height / 2
        }
    }
    ///扩展的构造函数，必须是遍历构造函数，指定构造函数必须写在类本身的定义中
     convenience init(center: Point, size: Size){
        let originx = center.x - size.width / 2
        let originy = center.y - size.height / 2
        self.init(origin:Point(x: originx, y: originy),size:size)
    }
    
}


extension Rectangle{
    enum Vertex: Int {
        case LeftTop
        case RightTop
        case LeftBottom
        case RightBottom
    }
    
    func pointAtVertex(v: Vertex) -> Point{
        switch v {
        case .LeftTop:
            return self.origin;
        case .RightTop:
            return Point(x: self.origin.x + self.size.width,y: self.origin.y);
        case .LeftBottom:
            return Point(x: self.origin.x, y: self.origin.y + self.size.height);
        case .RightBottom:
            return Point(x: self.origin.x + self.size.width,y: self.origin.y + self.size.height);
        }
    }
    
    
    subscript(index: Int) -> Point{
        assert(index >= 0 && index < 4, "Index in Rectangle Out of Range.")
        return pointAtVertex(v: Vertex(rawValue: index)!)
    }
}


let rect = Rectangle(origin: Point(x: 5,y: 5), size: Size(width: 20,height: 20))
rect.translate(x: 10, y: 10)
rect.pointAtVertex(v: .RightBottom)
rect[0]
rect[3]


/// Nested type 嵌套的类型

class UI{
    
    enum Theme{
        case DayMode
        case NightMode
    }

    var fontColor: UIColor!
    var backgroundColor: UIColor!

    var themeMode: Theme = .DayMode{
        didSet{
            self.changeThemeMode(themeMode: themeMode)
        }
    }
    
    init(themeMode:Theme){
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
ui.themeMode

ui.themeMode = .NightMode
ui.fontColor
ui.backgroundColor


/// 扩展标准类库

extension Int{
    /// 平方
    var square: Int{
        return self * self
    }
    /// 立方
    var cube: Int{
        return self * self * self
    }
    
    func inRange(closedLeft: Int, openedRight: Int) -> Bool{
        return self >= closedLeft && self < openedRight
    }
    
    func repetitions( task: () -> Void){
        for _ in 0 ... self{
            task()
        }
    }
    
    //二进制
    //16进制
    //是不是素数
    //subscript
}

/// 十六进制码转化为UIColor

let num = 8
num*num
num.inRange(closedLeft: 0, openedRight: 10)
num.repetitions {
    print("hello")
}

for i in stride(from:0,to:20,by:2){
    print(i)
}
