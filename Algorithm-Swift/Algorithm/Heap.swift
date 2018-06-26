//
//  Heap.swift
//  Algorithm
//
//  Created by birneysky on 2018/5/30.
//  Copyright © 2018年 com.Tech. All rights reserved.
//

import Foundation

/*
 二叉堆  插入 删除操作 O(lgN)
 
             62
          /      \
         41       30
      /     \    /    \
     28     16  22     13
 
 二叉堆堆是一个二叉树，特性：任何一个节点都不大于它的父节点，必须是一颗完全的二叉数
 完全二叉树是指除了最后一层节点之外，其他层所有的节点个数必须是最大值，
    最后一层节点个数可以不是最大值，但是所有节点都必须集中在左侧
 比如下面的二叉树
                          62
                  /                 \
                41                   30
            /       \             /       \
          28         16         22        13
        /   \       /
       19    17    15
 
 上面的堆也被称为最大堆，树顶的元素总是那个最大的元素，
 相应的最小堆的定义 堆中的某个节点的值总是不小于其父节点的值
 
 可以使用数组来存储一个二叉堆，之所以使用数组存储二叉堆正是因为堆是一个完全二叉树
 如果上面的数自上而下，自左向右标上一个序列号 就会变成这样
                         62(1)
                 /                 \
            41(2)                 30(3)
         /         \              /         \
    28(4)          16(5)     22(6)      13(7)
    /      \          /
19(8)    17(9)    15(10)
 
这样每一个左节点的序列号都是父节点的二倍，右节点则是父节点2倍加1， 当然可以从0标记
 如果用数组表示就是如下这样：
 0   1    2   3    4    5   6    7    8   9   10
 *   62  41  30  28  16  22  13   19  17  15
 注意0索引是不使用的
 这样就可以容易找到某个节点对应的父节点的元素，还有左节点和右节点的元素
 parent(i) = i  / 2
 left(i) = 2*i
 right(i) = 2*i + 1

 Shift Up 向堆中插入一个元素   假设插入一个元素52
将52添加到数组的末端，然后比较52根父节点16的大小，52>16 , 那么交换位置，直到52小于其父节点为止
                                 62(1)
                          /                 \
                    52(2)                 30(3)
                  /         \              /         \
             28(4)         41(5)     22(6)      13(7)
            /      \          /     \
        19(8)    17(9)   15(10) 16(11)
 
 Shift down  从堆中取出一个元素，只能取出根节点的那个元素，对于最大堆来说就取出了优先级最大的那个元素
 取出根节点62后，将最后一个元素放到第一个元素的位置就可以了,然后调整元素使其保持最大堆的性质，基本思路是
 将跟根节点的元素一步一步向下移动，使其找到相应的位置。16 向下移动时可以向左移动也可以向右移动，
 如果左子节点大于右子节点，就跟左子节点交换位置，
 在这个例子里 16 跟 52 交换位置 这样换完后 52 比 16 和 30 都要大 满足了最大堆的性质
62(1)
                                52 (1)
                          /                 \
                    16(2)                 30(3)
                   /         \              /         \
             28(4)          41(5)     22(6)      13(7)
             /      \          /    \
         19(8)    17(9)  15(10)
 下一步继续尝试看16是否还要继续下移，比较16的左右两个孩子28 和 41 ，41 大，16和41交换位置
                            52 (1)
                    /                 \
               41(2)                 30(3)
             /         \              /         \
       28(4)          16(5)     22(6)      13(7)
     /      \          /    \
   19(8)    17(9)  15(10)
 
 继续将16它的孩子们相比较，这里16 只有左孩子，那么就拿16和15做比较，发现16大于15 ，那么不发生交换。
 到此，Shift Down 的操作就完成了
 
 */


class MaxHeap  {
    private var data: [Int]
    private var count: Int
    init(capacity: Int) {
        //data = Array<Int>(repeating: 0, count: capacity + 1)
        data = [Int](repeating: 0, count: capacity + 1)
        count = 0
    }
    
    private func shiftUp(_ k: Int) {
        var index = k
        /// 由于索引0 不使用，所以数组中至少有两个元素时
        while index > 1 && data[index] > data[index/2] {
            data.swapAt(index, index/2)
            index = index / 2
        }
    }
    
    private func shiftDown(_ k: Int) {
        var i = k
        ///首先要保证 k 索引的元素有左孩子
        while 2 * i <= count {
            ///左孩子索引
            let j  = 2 * i
            ///如果有右孩子 比较左右孩子
            if j+1 <= count {
                if  data[j] > data[j+1] {
                    data.swapAt(i, j)
                    i = j
                } else {
                    data.swapAt(i, j+1)
                    i = j+1
                }
            } else {
                if data[i] < data[j] {
                    data.swapAt(i, j)
                }
            }
            
        }
    }
        
    private func shiftDown2(_ k: Int) {
        var i = k
        while 2 * i <= count {
            var j = 2 * i
            if j + 1 <= count && data[j+1] > data[j] {
                j += 1
            }
            
            if data[i] >= data[j] {
                break
            }
            data.swapAt(i, j)
            i = j
        }
        
    }
    
    public func size() -> Int {
        return count
    }
    
    public func isEmpty() -> Bool {
        return count == 0
    }
    
    public func insert(item: Int) {
        if count + 1 >= data.count {
            data.append(item)
        } else {
            data[count+1] = item;            
        }
        count += 1
        shiftUp(count)
    }
    
    public func extractMax() -> Int {
        assert(count > 0)
        let ret = data[1]
        data.swapAt(1, count)
        count -= 1
        shiftDown(1)
        return ret
        
    }
}
