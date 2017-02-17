//
//  SortTestHelper.swift
//  Algorithm
//
//  Created by zhangguang on 17/2/16.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation

class SortTestHelper{
    
    static func isSorted<T:Comparable>(_ array:[T]) -> Bool{
        let n = array.count - 1
        for i in 0 ..< n{
            if array[i] > array[i+1] {
                return false
            }
        }
        return true
    }

    
    /// 生成有n个元素的随机数组，每个元素的随机范围为[rangeL,rangeR]
    ///
    /// - Parameters:
    ///   - n: 数组长度
    ///   - rangeL: 左侧区间值
    ///   - rangeR: 右侧区间值
    /// - Returns: 随机数组
    static func generateRandomIntArray(n: Int, rangeL: Int, rangeR: Int) -> [Int]{
        assert(rangeL <= rangeR)
        let range = rangeR - rangeL + 1
        var array = [Int]()
        for _ in 0 ..< n{
            array.append(Int(arc4random()) % range + rangeL)
        }
        return array
    }
    
    
    /// 生成有n个元素的近乎有序的随机数组
    ///
    /// - Parameters:
    ///   - n: 数组长度
    ///   - swapTimes: 交换次数
    static func generateNearlyOrderedArray(n: Int, swapTimes:Int) -> [Int] {
        var array = [Int]()
        for i in 0 ..< n{
            array.append(i)
        }
        
        for _ in 0 ..< swapTimes{
            let left = Int(arc4random()) % n
            let right = Int(arc4random()) % n
            swap(&array[left], &array[right])
        }
        
        return array
    }
    
    static func testSort<T:Comparable>(sortName: String, algorighm:(inout [T]) -> Void, array: inout [T]){
        let startTime = clock()
        algorighm(&array)
        let endTime = clock()
        let duration = Double(endTime - startTime) / Double(CLOCKS_PER_SEC)
        print("\(sortName):",duration,"s")
        assert(isSorted(array))
    }
}
