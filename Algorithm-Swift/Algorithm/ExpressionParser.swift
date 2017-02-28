//
//  ExpressionParser.swift
//  Algorithm
//
//  Created by zhangguang on 17/2/27.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation


extension Character{
    var isDigit: Bool{
        if self >= "0" && self <= "9"  {
            return true
        }
        return false
    }
    
    var isSharp: Bool{
        return self == "#"
    }
}

enum Sign{
    case Number(Int)
    case Sharp
    case Plus
    case Minus
    case Times
    case Division
    
    init?( symbol: Character){
        switch symbol {
        case "#":
            self = .Sharp
        case "+":
            self = .Plus
        case "-":
            self = .Minus
        case "*":
            self = .Times
        case "/":
            self = .Division
        default:
            return nil
        }
    }
    
    init( value: Int){
        self = .Number(value)
    }
    
    var priority: Int{
        switch self {
        case .Sharp, .Number:
            return 100
        case .Plus, .Minus:
            return 120
        case .Times,.Division:
            return 140
        }
    }
    
    var value: Int?{
        switch self {
        case let .Number(value):
            return value
        default:
            return nil
        }
    }
    
    static func * (left: Sign, right: Sign) -> Sign?{
        
        guard let lvalue = left.value,
              let rvalue = right.value else{
              return nil
        }
        
        let result = lvalue * rvalue
        return Sign(value: result)
    }
    
    static func - (left: Sign, right: Sign) -> Sign?{
        
        guard let lvalue = left.value,
            let rvalue = right.value else{
                return nil
        }
        
        let result = lvalue - rvalue
        return Sign(value: result)
    }
    
    static func / (left: Sign, right: Sign) -> Sign?{
        
        guard let lvalue = left.value,
            let rvalue = right.value else{
                return nil
        }
        
        let result = lvalue / rvalue
        return Sign(value: result)
    }
    
    static func + (left: Sign, right: Sign) -> Sign?{
        
        guard let lvalue = left.value,
            let rvalue = right.value else{
                return nil
        }
        
        let result = lvalue + rvalue
        return Sign(value: result)
    }
    
}

indirect enum ArithmeticExpression{
    case Number(Int)
    case Addition(ArithmeticExpression,ArithmeticExpression)
    case Multiplication(ArithmeticExpression,ArithmeticExpression)
    case Subtraction(ArithmeticExpression,ArithmeticExpression)
    case Division(ArithmeticExpression,ArithmeticExpression)
    
    private func evaluate(_ expression: ArithmeticExpression) -> Int{
        switch expression {
        case let .Number(value):
            return value
        case let .Addition(left,right):
            return evaluate(left) + evaluate(right)
        case let .Multiplication(left,right):
            return evaluate(left) * evaluate(right)
            
        case let .Subtraction(left,right):
            return evaluate(left) - evaluate(right);
        case let .Division(left,right):
            return evaluate(left) / evaluate(right);
        }
    }
    
    
    public func evaluate() -> Int{
        return evaluate(self)
    }
}



/// [逆波兰表达式求解](http://blog.csdn.net/shiwazone/article/details/47067921)
class ExpressionParser{
    private var expression: String
    private var  numStack: Stack<Sign>
    private var  operatorStack: Stack<Sign>
    

    
    
    init(expression: String){
        self.expression = expression
        self.numStack = Stack<Sign>()
        self.operatorStack = Stack<Sign>()
        if let sign = Sign(symbol: "#"){
            self.operatorStack.push(element: sign)
        }
    }
    
    
    func parse() -> [Sign] {
        var num: String = String();

        for character in self.expression.characters {

            if character.isDigit {
                num.append(character)
            }
            else{
                if let value = Int(num){
                    self.numStack.push(element: Sign.Number(value));
                    num.removeAll();
                }
                
                guard let sign = Sign(symbol: character) else{
                    assert(false, "非法操作符")
                }
                
                guard let topSign = self.operatorStack.peek() else{
                    print("operator stack is empty")
                    break;
                }
                
                if sign.priority >= topSign.priority {
                    self.operatorStack.push(element: sign)
                }
                else if !character.isSharp{
                    let popSign = self.operatorStack.pop()
                    self.numStack.push(element: popSign!)
                    self.operatorStack.push(element: sign)
                }

            }
        }

        while !self.operatorStack.isEmpty() {
            let sign = self.operatorStack.pop()!
            switch sign {
            case .Plus,.Minus,.Times,.Division:
                self.numStack.push(element: sign)
            default:
                break
            }
        }
        return self.numStack.array
    }
    
    
    
    func evaluate(signs: [Sign]) -> Int?{
        
        let caluateStatck = Stack<Sign>()
        for sign in signs{
            switch sign {
            case .Number(_):
                caluateStatck.push(element: sign)
            case .Times:
                guard let right = caluateStatck.pop(),
                      let left = caluateStatck.pop() else{
                    assert(false)
                }
                if let result = left * right{
                    caluateStatck.push(element: result)
                }
            case .Minus:
                guard let right = caluateStatck.pop(),
                    let left = caluateStatck.pop() else{
                        assert(false)
                }
                if let result = left - right{
                    caluateStatck.push(element: result)
                }
            case .Plus:
                guard let right = caluateStatck.pop(),
                    let left = caluateStatck.pop() else{
                        assert(false)
                }
                if let result = left + right{
                    caluateStatck.push(element: result)
                }
            case .Division:
                guard let right = caluateStatck.pop(),
                    let left = caluateStatck.pop() else{
                        assert(false)
                }
                if let result = left / right{
                    caluateStatck.push(element: result)
                }
            default:
                assert(false,"未知运算符")
            }
        }
        
        return caluateStatck.pop()?.value
    }
    
    
    
    func calculate() -> Int?{
        let signArray = self.parse()
        let stackExpression = Stack<ArithmeticExpression>()
        for sign in signArray{
            var expression: ArithmeticExpression?;
            switch sign {
            case let .Number(value):
                stackExpression.push(element:ArithmeticExpression.Number(value))
            case .Times:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                let xxx = ArithmeticExpression.Multiplication(left, right)
                stackExpression.push(element:xxx)
            case .Division:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                stackExpression.push(element:ArithmeticExpression.Division(left, right))
            case .Minus:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                stackExpression.push(element:ArithmeticExpression.Subtraction(left, right))
            case .Plus:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                stackExpression.push(element:ArithmeticExpression.Addition(left, right))
            default:
                assert(false,"未知数值或运算符")
            }
            //stackExpression.push(element: expression!)
        }
        
        let a = stackExpression.pop();
        return a?.evaluate()
    }
    
}
