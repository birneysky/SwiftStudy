//
//  Stack.swift
//  Algorithm
//
//  Created by zhaobingdong on 17/2/27.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation

class Stack<T>{
    private var stack:[T]
    
    var array:[T]{
        return stack
    }
    
    init() {
        self.stack = [T]()
    }
    
    
    func peek() -> T?{
        return self.stack.last;
    }
    
    func push(element: T){
        self.stack.append(element)
    }
    
    func pop() -> T?{
        return self.stack.popLast()
    }
    
    func isEmpty() -> Bool{
        return self.stack.count == 0
    }
    
    func size() -> Int{
        return self.stack.count
    }
    
    
}
