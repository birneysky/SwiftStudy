//
//  SortAlgorigthm.swift
//  Algorithm
//
//  Created by zhaobingdong on 17/2/16.
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
            array.swapAt(9, minIndex)
        }
    }
}

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
                array.swapAt(j, j-1)
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


/// 将arr[left,middle]和【middle,right]两部分进行归并
///
/// - Parameters:
///   - array: 带归并数组
///   - left: left
///   - middle: midle
///   - right: right
private func __merge<T:Comparable>(array: inout [T], left: Int, middle: Int, right: Int){
    var aux = [T]()////auxiliar
    for i in left...right {
        aux.append(array[i])
    }
    
    var i = left, j = middle + 1
    for k in left...right{
        
        /// i,j 的位置
        if i > middle{
            array[k] = aux[j-left]
            j += 1
        }
        else if j > right{
            array[k] = aux[i-left]
            i += 1
        }
       else if aux[i-left] < aux[j-left] {
            array[k] = aux[i-left]
            i += 1
        }
        else{
            array[k] = aux[j-left]
            j += 1
        }
        
    }
    
}

/// 递归使用归并排序，对arr[left,right]的范围进行排序
///
/// - Parameters:
///   - array: 待排序数组
///   - left: left
///   - right: right
private func __mergeSort<T:Comparable>(array: inout [T], left: Int, right: Int){
    if left >= right {
        return
    }
    
    let middle = (right - left) / 2 + left
    __mergeSort(array: &array, left: left, right: middle)
    __mergeSort(array: &array, left: middle + 1, right: right)
    __merge(array: &array, left: left, middle: middle, right: right)
    
}


public func mergeSort<T:Comparable>(array: inout [T]){
    let n = array.count
    __mergeSort(array: &array, left: 0, right: n - 1)
}



/// 使的数组array[left...right]部分进行partition操作
///
/// - Parameters:
///   - array: 数组
///   - left: left
///   - right: right
/// - Returns: 返回p ，使得的array[left...p-1] < array[p], array[p+1...right] > array[p]
private func partition<T:Comparable>(array: inout [T], left: Int, right: Int) -> Int{
    
    let v = array[left]
    
    ///arra[left+1...j] < v array[j+1...i) > v
    /// i表示当前正在考察元素的索引
    var j = left
    for i in left+1...right{
        if array[i] < v {
            j += 1
            if j != i {
                array.swapAt(j, i);
                //(array[j],array[i]) = (array[i],array[j])
            }
        }
    }
    if left != j {
        array.swapAt(left, j)
    }
    //(array[left],array[j]) = (array[j],array[left])
    return j
}


/// 对数组array[left...right]部分进行快速排序
///
/// - Parameters:
///   - array: right
///   - left: left
///   - right: right
private func quickSort<T:Comparable>(array: inout [T], left: Int, right: Int){
    
    if left >= right {
        return
    }
    
    let p = partition(array: &array, left: left, right: right)
    quickSort(array: &array, left: left, right: p-1)
    quickSort(array: &array, left: p+1, right: right);
    
}

public func quickSort<T:Comparable>(array: inout [T]){
    let n = array.count
    quickSort(array: &array, left: 0, right: n-1)
}



