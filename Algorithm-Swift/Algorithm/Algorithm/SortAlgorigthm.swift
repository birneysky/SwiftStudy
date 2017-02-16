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
        swap(&array[i], &array[minIndex])
    }
}
