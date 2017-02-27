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
        if self > "0"  {
            <#code#>
        }
        return true;
    }
}

class ExpressionParser{
    private var expression: String
    private var  numStack: Stack<String>
    private var  operatorStack: Stack<Character>
    
    init(expression: String){
        self.expression = expression
        self.numStack = Stack<String>()
        self.operatorStack = Stack<Character>()
    }
    
    
    func parse(){
        for character in self.expression.characters{
            print(character);
        }
    }
    
}
