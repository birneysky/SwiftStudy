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
        if self > "0" && self < "9"  {
            return true
        }
        return false
    }
    
    
}

class ExpressionParser{
    private var expression: String
    private var  numStack: Stack<String>
    private var  operatorStack: Stack<Character>
    
    indirect enum ArithmeticExpression{
        case Number(Int)
        case Addition(ArithmeticExpression,ArithmeticExpression)
        case Multiplication(ArithmeticExpression,ArithmeticExpression)
        case Subtraction(ArithmeticExpression,ArithmeticExpression)
    }
    
    
    init(expression: String){
        self.expression = expression
        self.numStack = Stack<String>()
        self.operatorStack = Stack<Character>()
    }
    
    
    func parse(){
        var num: String = String();
        var mathSymbol: String = String();
        for character in self.expression.characters{
        
            if character.isDigit {
                num.append(character)
                //print(character)
            }
            else{
                self.numStack.push(element: num);
                num.removeAll();
                mathSymbol.append(character)
                self.operatorStack.push(element: character)
            }
        }
    
        
    }
    
}
