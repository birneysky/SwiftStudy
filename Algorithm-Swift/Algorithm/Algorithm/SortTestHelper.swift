//
//  SortTestHelper.swift
//  Algorithm
//
//  Created by zhangguang on 17/2/16.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation

class SortTestHelper{
    
    static func isSorted<T:Comparable>(array:[T]) -> Bool{
        return true
    }

    static func generateRandomIntArray(n: Int, rangeL: Int, rangeR: Int) -> [Int]{
        assert(rangeL <= rangeR)
        let range = rangeR - rangeL + 1
        var array = [Int]()
        for _ in 0 ... n{
            array.append(Int(arc4random()) % range + rangeL)
        }
        return array
    }
    
    static func testSort<T:Comparable>(sortName: String, algorighm:(inout [T]) -> Void, array: inout [T]){
        let startTime = clock()
        algorighm(&array)
        let endTime = clock()
        let duration = Double(endTime - startTime) / Double(CLOCKS_PER_SEC)
        print("\(sortName):",duration,"s")
        
    }
}
