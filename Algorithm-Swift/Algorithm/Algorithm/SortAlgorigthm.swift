//
//  SortAlgorigthm.swift
//  Algorithm
//
//  Created by zhangguang on 17/2/16.
//  Copyright © 2017年 com.Tech. All rights reserved.
//

import Foundation

/// 选择排序
///
/// - Parameter array: 数组
func selectSort<T:Comparable>(array: inout [T]){
    let n = array.count
    for i in 0 ..< n{
        var minIndex = i
        ///寻找[i,n)区间内的最小值
        for j in i ..< n{
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if i != minIndex {
            swap(&array[i], &array[minIndex])
        }
    }
}


/// 系统内置的sort函数的包装，不清楚使用什么排序，猜测是快速排序
///
/// - Parameter array: 测试数组
func sortInStdLib<T:Comparable>(array: inout [T]){
    array = array.sorted(by: <)
}

/**
 插入排序,从小到大
 
 - Parameter array: 测试数组
 
 ```
 /// i 外层循环索引， j 内层循环索引
///  i = 1  j = i   i >= 1 && i < n  j > 0 && j <= i
 
 
 i = 1
 2 6 3 4 7 9 1 5 8
 
 6 > 2, i++ --> i = 2
 2 6 3 4 7 9 1 5 8
 
 3 < 6, swap(3,6),j--,比较3和2,3 > 2,结束, -->
 2 3 6 4 7 9 1 5 8
 
 4 < 6, swap(4,6),j--,比较4 和 3 ... -->
 2 3 4 6 7 9 1 5 8
 
 4 < 6, swap(4,6),...  -->
 2 3 4 6 7 9 1 5 8
 
 ...
 
 1 < 9, swap(1,9),...  -->
 2 3 4 6 7 1 9 5 8


 1 < 7, swap(1,7),...  -->
 2 3 4 6 1 7 9 5 8
 
 1 < 6, swap(1,6),...  -->
 2 3 4 1 6 7 9 5 8
 
 ```
 */

func insertSort<T:Comparable>(array: inout [T]){
    let n = array.count
    for i in 1 ..< n {
        for j in stride(from: i, to: 0, by: -1){
            if array[j] < array[j-1] {
                swap(&array[j], &array[j-1])
            }
            else {
                break
            }
        }
    }
}


///  插入排序的改进版本,对于近乎有序的数组插入排序表现出了卓越的性能
///   
///  先将待插入元素保存一份e，然后拿e与e位置之前的元素挨个比较，如果e小于他们，该元素后移，直到好到e应该防止的位置
///
/// - Parameter array: 待排序数组
func insertSort2<T:Comparable>(array: inout [T]){
    let n = array.count
    for i in 1 ..< n {
        let e = array[i]
        var j = i
        for _ in stride(from: i, to: 0, by: -1){
            if e < array[j - 1]{
                array[j] = array[j-1]
                j -= 1
            }
            else{
                break
            }
        }
        array[j] = e
    }
}

//private func mergeSort<T:Comparable>

//func selectSort<T:Comparable>(array: inout [T], by:((T,T)->Bool) = {$0 < $1}){
//    let n = array.count
//    for i in 0..<n{
//        var minIndex = i
//        ///寻找[i,n)区间内的最小值
//        for j in i ..< n{
//            if by(array[j],array[minIndex]) {
//                minIndex = j
//            }
//        }
//        swap(&array[i], &array[minIndex])
//    }
//}



