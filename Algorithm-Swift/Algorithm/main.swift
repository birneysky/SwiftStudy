//
//  main.swift
//  Algorithm
//
//  Created by zhaobingdong on 17/2/16.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation

let n = 10
var times = 200

var array = SortTestHelper.generateRandomIntArray(n: n, rangeL: 0, rangeR: n)
///var array = SortTestHelper.generateNearlyOrderedArray(n: n, swapTimes: times)
var copyArray1 = array
var copyArray2 = array
var copyArray3 = array
var copyArray4 = array
var copyArray5 = array
var copyArray6 = array

SortTestHelper.testSort(sortName: "SortInStdLibrary", algorighm: sortInStdLib, array: &copyArray1)
SortTestHelper.testSort(sortName: "SelectionSort", algorighm: selectSort, array: &array)
SortTestHelper.testSort(sortName: "InsertSort", algorighm: insertSort, array: &copyArray2)
SortTestHelper.testSort(sortName: "InsertSort2", algorighm: insertSort2, array: &copyArray3)
SortTestHelper.testSort(sortName: "MergeSort", algorighm: mergeSort, array: &copyArray4)
SortTestHelper.testSort(sortName: "QuickSort", algorighm: quickSort, array: &copyArray5)
SortTestHelper.testSort(sortName: "MergeSortBU", algorighm: mergeSortBU, array: &copyArray6)

mergeSortBU(array: &copyArray6)

var stack = Stack<String>()

var expressionParser = ExpressionParser(expression:"2+3*4+9/3+(1+2)*3#")///

var maxHeap: MaxHeap = MaxHeap(capacity: 100)



//let signs = expressionParser.parse()
//let a = expressionParser.evaluate(signs: signs);
//let b = expressionParser.calculate();

//print(a)
//print(b!)



/*
 Graph Theory
 
有节点和边构成的数据结构
节点(Vertex)
边(Edge)
 */
