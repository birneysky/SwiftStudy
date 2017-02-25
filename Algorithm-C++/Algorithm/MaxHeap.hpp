//
//  MaxHeap.hpp
//  Algorithm
//
//  Created by birneysky on 2017/2/25.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#ifndef MaxHeap_hpp
#define MaxHeap_hpp

#include <iostream>
#include <cassert>

/**
 完全二叉树： 一个二叉树，除了最后一层节点之外，其它层所有节点个数必须是最大值
 
 二叉堆：是一个完全二叉树，最后一层节点都必须集中在左侧
 
 最大堆：堆中某个节点的值总是不大于其父节点的值, 最小堆与其相反
 
             62
         /       \
        41        30
      /    \     /  \
    28      16   22   13
   /  \     /
   19  17  15
 
 
 可以用数组存储二叉堆， 
 假设索引从1 开始。
 parent = i / 2
 left = 2 * i
 right = 2 * i + 1
 
 */

template<typename Item>
class MaxHeap{
private:
    Item* data;
    int count;
    int capacity;
    
    void shiftUp(int k){
        
        while ( k > 1 && data[k] > data[k/2]) {
            std::swap(data[k], data[k/2]);
             k = k / 2;
        }
    }
public:
    MaxHeap(int capacity){
        data = new Item(capacity + 1);//从索引1开始，0不使用
        count = 0;
        this->capacity = capacity;
    }
    
    ~MaxHeap(){
        delete [] data;
    }
    
    int size(){
        return count;
    }
    
    bool isEmpty(){
        return count == 0;
    }
    
    void insert(Item item){
        assert(count + 1 <= capacity);
        data[count + 1] = item;
        count ++;
        shiftUp(count);
    }
    
};


#endif /* MaxHeap_hpp */
