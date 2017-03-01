//
//  ExpressionParser.swift
//  Algorithm
//
//  Created by zhangguang on 17/2/27.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation





/// [逆波兰表达式求解](http://blog.csdn.net/shiwazone/article/details/47067921)
class ExpressionParser{
    private var expression: String
    private var  numStack: Stack<Sign>
    private var  operatorStack: Stack<Sign>

    enum Sign{
        case Number(Int)
        case Sharp
        case Plus
        case Minus
        case Times
        case Division
        case LParentheses
        case RParentheses
    }
    
    indirect enum ArithmeticExpression{
        case Number(Int)
        case Addition(ArithmeticExpression,ArithmeticExpression)
        case Multiplication(ArithmeticExpression,ArithmeticExpression)
        case Subtraction(ArithmeticExpression,ArithmeticExpression)
        case Division(ArithmeticExpression,ArithmeticExpression)
    }
    
    
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
                    self.numStack.push(element: .Number(value));
                    num.removeAll();
                }
                
                guard let sign = Sign(symbol: character) else{
                    assert(false, "非法操作符")
                }
                
                if sign.isRightParentheses {
                    while let popSign = self.operatorStack.pop()  {
                        if popSign.isLeftParentheses {
                            break;
                        }
                        self.numStack.push(element: popSign)
                    }
                    continue
                }
                
                guard let topSign = self.operatorStack.peek() else{
                    print("operator stack is empty")
                    break;
                }
                
                if sign.priority >= topSign.priority || sign.isLeftParentheses{
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
            case .Plus,.Minus,.Times,.Division, .Number(_):
                self.numStack.push(element: sign)
            default:
                break
            }
        }
        return self.numStack.array
    }
    
    
    func calculate() -> Int?{
        let signArray = self.parse()
        let stackExpression = Stack<ArithmeticExpression>()
        for sign in signArray{
            switch sign {
            case let .Number(value):
                stackExpression.push(element:.Number(value))
            case .Times:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                stackExpression.push(element:.Multiplication(left, right))
            case .Division:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                stackExpression.push(element:.Division(left, right))
            case .Minus:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                stackExpression.push(element:.Subtraction(left, right))
            case .Plus:
                guard let right = stackExpression.pop(),
                    let left = stackExpression.pop() else{
                        assert(false)
                }
                stackExpression.push(element:.Addition(left, right))
            default:
                assert(false,"未知数值或运算符")
            }
            //stackExpression.push(element: expression!)
        }
        
        let a = stackExpression.pop();
        return a?.evaluate()
    }
    
}

extension ExpressionParser.ArithmeticExpression{
    private func evaluate(_ expression: ExpressionParser.ArithmeticExpression) -> Int{
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

extension ExpressionParser.Sign{
    
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
        case "(":
            self = .LParentheses
        case ")":
            self = .RParentheses
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
        case .LParentheses, .RParentheses:
            return 90
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
    
    var isLeftParentheses: Bool{
        switch self {
        case .LParentheses:
            return true
        default:
            return false
        }
    }
    
    var isRightParentheses: Bool{
        switch self {
        case .RParentheses:
            return true
        default:
            return false
        }
    }
}

