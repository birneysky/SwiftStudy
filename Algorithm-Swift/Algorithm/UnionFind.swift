//
//  UnionFind.swift
//  Algorithm
//
//  Created by birney on 2018/1/22.
//  Copyright © 2018年 com.Tech. All rights reserved.
//

import Cocoa

class UnionFindA {
    private var nodes: [Int]
    private var count:Int
    
    init(capacity: Int) {
        count = capacity
        nodes = Array(repeating: 0, count: capacity)
        for (index,_) in nodes.enumerated() {
            nodes[index] = index
        }
    }
    func isConnected(p: Int, q: Int) -> Bool {
        return true
    }
    
    func find(p: Int) -> Int {
        return nodes[p]
    }
    
    func union(p: Int, q: Int)  {
        
    }
}
