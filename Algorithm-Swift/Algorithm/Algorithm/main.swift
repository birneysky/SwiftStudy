//
//  main.swift
//  Algorithm
//
//  Created by zhangguang on 17/2/16.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation

//print("Hello, World!")
//
//
//var array: [Int] = [Int]()
//let start = clock()
//for i in 0...140_000_000{
//    array.append(i)
//}
//let end = clock()
//
//print(Double(end - start) / Double(CLOCKS_PER_SEC))


var array = SortTestHelper.generateRandomIntArray(n: 10_000, rangeL: 10, rangeR: 10000)

SortTestHelper.testSort(sortName: "SelectionSort", algorighm: selectSort, array: &array)
