//: Playground - noun: a place where people can play

import UIKit

var shopingList = ["catFish","Water", "tulips", "blue paint"]

/*
enum Month{
    case January
    case February
    case March
    case Arpil
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

enum Season{
    case Spring, Summer, Autumn, Winter
}

func season(_ month: Month ) -> Season
{
    switch month {
    case .March, .Arpil, .May:
        return .Spring
    case .June, .July, .August:
        return .Summer
    case .September, .October, .November:
        return .Autumn
    case .December, .January, .February:
        return .Winter
    }
}



let curMonth = Month.July
let curMonth1: Month = .July

let month = "June"
season( curMonth )*/

//// raw Value

enum Month: Int{
    case January = 1
    case February = 2
    case March = 3
    case Arpil = 4
    case May = 5
    case June = 6
    case July = 7
    case August = 8
    case September = 9
    case October = 10
    case November = 11
    case December = 12
}

func monthsBeforeNewYear(_ month: Month ) -> Int{
    return 12 - month.rawValue;
}


let month: Month = .October

let input = 6;
let month1 = Month(rawValue: input)
if let month = month1 {
    monthsBeforeNewYear(month)
}


enum Grade: Int{
    case F, E, D, C, B, A
}

Grade.F.rawValue
let grade:Grade = .A
print("Your score is \(grade.rawValue)")


enum Coin: Int{
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
}

let coin:Coin = .Quarter
print("It's a \(coin.rawValue) cents")

enum ProgramingLanguage: String{
    case Swift
    case Objectivec = "Objective-C"
    case C
    case Java
    case CPlusPlus = "C++"
    
}

let myFavoriteLanguage:ProgramingLanguage = .CPlusPlus
print("\(myFavoriteLanguage.rawValue) is my favorite language");


///相关值 associate value
enum ATMStatus{
    case Success(Int)
    case Error(String)
    case Waiting
}

var balance = 1000

func withdraw( amount: Int) -> ATMStatus{
    if amount <= balance {
        balance -= amount
        return .Success(balance)
    }
    else{
        return .Error("Not enough money")
    }
}


let result = withdraw(amount: 100)
/// 相关值得解析
switch result {
case let .Success(newBalance):
    print("\(newBalance) Yuan left in your account")
case let .Error(errorMessage):
    print("Error: \(errorMessage)")
case .Waiting:
    print("Waiting")
}

/// 不解析相关值
switch result {
case .Success:
    print("Success")
case .Error:
    print("Error")
case .Waiting:
    print("Waiting")
}

/// 关联元祖
enum Shape{
    case Square(side: Double)
    case Rectangle(width: Double, height: Double)
    case Circle(centerx: Double, centery: Double, radius: Double)
    case Point
}

let square = Shape.Square(side: 10)
let rectangle = Shape.Rectangle(width: 20, height: 30)
let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
let point = Shape.Point

func area(_ shape: Shape) -> Double
{
    switch shape {
    case let .Square(side):
        return side * side
    case let .Rectangle(width,height):
        return width * height
    case let .Circle(_,_,r):
        return M_PI * r * r
    case .Point:
        return 0
    }
}

area(square)
area(rectangle)
area(circle)
area(point)

/// 可选型的实质是枚举

var age: Int? = 17
print(age as Any)
age = nil;
/// Optional<String> 等价于 String?
var website:Optional<String> = Optional.some("www.baidu.com");
print(website as Any)

website = .none
/// apple 在编译层面处理了这种赋值
website = "sina"
print(website as Any)
//website = nil /// nil 代替了 .none

///也可以采用枚举的方式解包
switch website{
case let .some(website):
    print("the website is \(website)")
case .none:
    print("no website")
}


/// 苹果对上面解包方式的简化
if let website = website{
    print("the website is \(website)")
}
else{
    print("no website")
}



/// 枚举递归  indirect 告诉编译器枚举中含有递归的定义

indirect enum ArithmeticExpression{
    case Number(Int)
    case Addition(ArithmeticExpression,ArithmeticExpression)
    case Multiplication(ArithmeticExpression,ArithmeticExpression)
    case Subtraction(ArithmeticExpression,ArithmeticExpression)
}

/// (5 + 4) * 2

let five = ArithmeticExpression.Number(5);
let four = ArithmeticExpression.Number(4);
let sum = ArithmeticExpression.Addition(five, four)
let two = ArithmeticExpression.Number(2)
let product = ArithmeticExpression.Multiplication(sum, two)

func evaluate(_ expression: ArithmeticExpression) -> Int{
    switch expression {
    case let .Number(value):
        return value
    case let .Addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .Multiplication(left, right):
        return evaluate(left) * evaluate(right)
    case let .Subtraction(left, right):
        return evaluate(left) - evaluate(right)
    }
}

evaluate(product)

