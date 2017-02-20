//
//  main.swift
//  Algorithm
//
//  Created by zhangguang on 17/2/16.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation

let n = 10000
var times = 200

var array = SortTestHelper.generateRandomIntArray(n: n, rangeL: 0, rangeR: n)
///var array = SortTestHelper.generateNearlyOrderedArray(n: n, swapTimes: times)
var copyArray1 = array
var copyArray2 = array
var copyArray3 = array

SortTestHelper.testSort(sortName: "SortInStdLibrary", algorighm: sortInStdLib, array: &copyArray1)
SortTestHelper.testSort(sortName: "SelectionSort", algorighm: selectSort, array: &array)
SortTestHelper.testSort(sortName: "InsertSort", algorighm: insertSort, array: &copyArray2)
SortTestHelper.testSort(sortName: "InsertSort2", algorighm: insertSort2, array: &copyArray3)

