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

//let signs = expressionParser.parse()
//let a = expressionParser.evaluate(signs: signs);
//let b = expressionParser.calculate();

//print(a)
//print(b!)

/**
 1. 找出数组中的重复数字。
 在一个长度为n的数组里的所有数字都在[0,n-1]的范围内。数组中某些数字是重复的，
 但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。
 例如，如果输入长度为7的数组{2,3,1,0,2,5,3}，那么对应的输出的重复的数组是2或者3
 
 2. 在不修改数组的情况下找出重复的数字
 
 3. 在一个二维数组中，每一行都按照从左到右的递增的顺序排序，每一列都按照从上到下的顺序递增的顺序排列。
 请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数
 
 4. 请实现一个函数，把字符串中每个空格替换成"%20"，例如输入"we are happy", 则输出 ”we%20are%20happy“
 
 5. 输入一个链表的头结点，从尾到头打印出每个结点的值。链表的结点定义如下
 struct ListNode {
    int m_nKey;
    ListNode* m_pNext;
 }
 
 6. 输入二叉树的前序遍历的和中序遍历的结果，请重建该二叉树。
 假设输入的前序遍历和中序遍历的结果中都不含重复数字。例如，输入前序遍历{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}
 重建二叉树并输出它的根结点。二叉树结点定义如下
 struct BinaryTreeNode {
    int m_nValue;
    BinaryTreeNode* m_pLeft;
    BinaryTreeNode* m_pRight;
 }
 
            1
        /      \
       2        3
       /       /  \
       4      5    6
        \          /
         7         8
 */


/*
 Graph Theory
 
有节点和边构成的数据结构
节点(Vertex)
边(Edge)
 */
