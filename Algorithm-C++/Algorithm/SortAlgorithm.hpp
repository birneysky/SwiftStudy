//
//  SortAlgorithm.hpp
//  Algorithm
//
//  Created by birneysky on 2017/2/3.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#ifndef SortAlgorithm_hpp
#define SortAlgorithm_hpp

#include <iostream>

namespace SortAlgorigthm {
    
    
    /**
     选择排序

     @param arr 数组地址
     @param n 数组长度
     */
    template<typename T>
    void selectionSort(T arr[], int n){
        for( int i = 0; i < n; i++){
            int minIndex = i;
            ///寻找[i,n)区间里的最小值
            for (int j = i + 1; j < n; j ++) {
                if(arr[j] < arr[minIndex]){
                    minIndex = j;
                }
            }
            std::swap(arr[i],arr[minIndex]);
        }
    }
    

    
    /**
     插入排序

     
     从小到大排序
     
     8  6  2  3  1  5  7  4
     
     8 > 6，交换8和6
     
     6  8  2  3  1  5  7  4
     
     8 > 2， 交换2和8
     
     6  2  8  3  1  5  7  4
     
     6 > 2, 交换6和2
     
     2  6  8  3  1  5  7  4
     
     8 > 3, 交换3和8
     
     2  6  3  8  1  5  7  4
     
     6 > 3,交换6和3
     
     2  3  6  8  1  5  7  4
     
     从第i个元素开始（初始为1），一次判断第i个元素和第i-1个元素的大小，如果第i-1个元素大于第i个元素，就交换这两个位置上的元素
     
     
     @param arr 数组地址
     @param n 数组长度
     */
    template <typename T>
    void insertSort(T arr[], int n) {
        for( int i = 1; i < n; i++){
            for ( int j = i ; j > 0;  j--) {
                if (arr[j] < arr[j - 1]) {
                    std::swap(arr[j],arr[j-1]); ///一次交换，三次赋值
                }
                else{
                    break;
                }
            }
        }
    }


    
    /**
     插入排序改进版本
     
     
     改进插入排序，减少赋值操作
     
     8  6  2  3  1  5  7  4
     
     先把6赋值一份，保存起来  int temp = 6;  然后查看6是否应该放在当前的位置（判断6是不是小于前一个位置的元素），如果不应该将8向后移动一个位置
     
     8  8  2  3  1  5  7  4
     
     然后查看6是不是应该放在前一个位置，发现前一个位置索引为0，所以直接复制
     
     6  8  2  3  1  5  7  4  ///发生赋值2次，减少了一次
     
     将2复制一份 temp = 2； 查看2 能不能放在前一个位置，发现可以将8后移一位
     
     6  8  8  3  1  5  7  4
     
     然后查看2 能不能放在前一个位置，发现可以将6 后移
     
     6  6  8  3  1  5  7  4
     
     然后查看2 能不能放在前一个位置，发现索引为0，直接赋值
     
     2  6  8  3  1  5  7  4
     
     将3 复制一份 temp = 3; 查看3能不能放在前一个位置，将8 后移。。。。
     
     2  6  8  8  1  5  7  4
     
     2  6  6  8  1  5  7  4
     
     2  3  6  8  1  5  7  4
     
     temp = 1
     
     2  3  6  8  8  5  7  4
     
     2  3  6  6  8  5  7  4
     
     2  3  3  6  8  5  7  4
     
     2  2  3  6  8  5  7  4
     
     1  2  3  6  8  5  7  4
     
     
     @param arr 数组地址
     @param n 数组长度
     */
    template <typename T>
    void insertSort2(T arr[], int n) {
        for( int i = 1; i < n; i++){
            T temp = arr[i];
            int j;
            for( j = i; j > 0; j--){
                if(temp < arr[j-1]){
                    arr[j] = arr[j-1];
                }
                else{
                    break;
                }
            }
            arr[j] = temp;
        }
    }
    
    
    template <typename T>
    void insertSort3(T arr[], int n) {
        for (int i = 1; i < n;  i++) {
            
            T e = arr[i]; ///表示存储待插入元素
            
            int j; ///表示应该插入的位置
            for (j = i; j > 0 && e < arr[j-1]; j--) {
                arr[j] = arr[j-1];
            }
            
            arr[j] = e;
        }
    }
    

    
    /**
     归并算法函数  自顶向下归并
     讲两个有序的数据合并成一个
     
     2  3  6  8  1  4  5  7
     ^(k)
     2  3  6  8  1  4  5  7
     ^(i)        ^(j)
     
     i(2),j(1)比较之后，j(1)应该放置在k的位置，所以j++，k++
     
     1  3  6  8  1  4  5  7
        ^(k)
     2  3  6  8  1  4  5  7
     ^(i)           ^(j)
     
     i(2),j(4)比较，i(2)应该放置在k的位置，所以i++,k++
     
     1  2  6  8  1  4  5  7
           ^(k)
     2  3  6  8  1  4  5  7
        ^(i)        ^(j)
     
     @param arr 数组地址
     @param l 数组最左侧的元素位置
     @param m 数组中间位置的元素位置
     @param r 数组最右侧的元素位置
     */
    template <typename T>
    void __merage(T arr[], int l, int m, int r) {
        
        T aux[r-l+1];
        for (int i = l; i <= r; i++) {
            aux[i -l] = arr[i];
        }
        
         /// 当前正在考虑的元素位置
        int i = l; int j = m + 1;
        /// k表示，i位置元素和j位置元素比较之后最终应该存储的位置
        for (int k = l; k <= r; k++) {
            
            if (i > m) {
                arr[k] = aux[j - l];
                j++;
            }
            else if( j > r){
                arr[k] = aux[i - l];
                i++;
            }
            else if (aux[i - l] > aux[j - l]) {
                arr[k] = aux[j - l];
                j++;
            }
            else{
                arr[k] = aux[i - l];
                i++;
            }
        }
        
    }
    
    
    
    /**
     递归归并

     @param arr 数组长度
     @param l 数组最左侧的位置
     @param r 数组最右侧的位置
     */
    template <typename T>
    void __merageSort(T arr[], int l, int r) {
        
        if (l >= r) {
            return;
        }
        
        int m = (l+r) / 2;
        
        __merageSort(arr, l, m);
        __merageSort(arr, m+1, r);
        __merage(arr,l,m,r);
    }
    
    
    /**
     归并排序

     @param arr 数组地址
     @param n 数组长度
     */
    template <typename T>
    void merageSort(T arr[] ,int n) {
        __merageSort(arr, 0, n-1);
    }
    

    
    /**
     自底向上归并排序
     
     
     @param array 数组地址
     @param n 数组长苏
     */
    template<typename T>
    void merageSortBottomToUp(T array[] ,int n){
        for (int size = 1; size <= n; size += size){
            for (int i = 0; i + size < n; i += 2 * size){
                __merage(array, i, i+size-1, std::min(i+ size*2 -1,n-1));
            }
        }
    }
    
    
    
    /**
     对array[l...r]部分进行partition

     @param array 数组
     @param l l
     @param r r
     @return 返回p，是的array[l...p-1] < array[p], array[p+1...r] > array[p]
     */
    template<typename T>
    int partition(T array[], int l, int r){
        
        T v = array[l];
        
        int j = l;
        for ( int i = l+1; i <= r; i++){
            if(array[i] < v){
                j++;
                std::swap(array[j],array[i]);
            }
        }
        std::swap(array[l],array[j]);
        return j;
    }
    
    
    template<typename T>
    int partition2(T array[], int l, int r){
        
        int randomIndex = rand() % (r -l + 1) + l;
        
        std::swap(array[l], array[randomIndex]);
        
        T v = array[l];
        
        int j = l;
        for ( int i = l+1; i <= r; i++){
            if(array[i] < v){
                j++;
                std::swap(array[j],array[i]);
            }
        }
        std::swap(array[l],array[j]);
        return j;
    }
    
    /**
     l                                             r
     _______________________________________________
     |   |          |   |            |   |         |
     | v |   <= v   | e |            | e |   >= v  |
     |___|__________|___|____________|___|_________|
                      i -->       <--  j
     
     
     v   < v
     */
    template<typename T>
    int partition3(T array[], int l, int r){
        
        int randomIndex = rand() % (r -l + 1) + l;
        
        std::swap(array[l], array[randomIndex]);
        
        T v = array[l];
        
        /// array[l+1...i] <= v array[j...r] >= v
        int i = l+1,j = r;
        while(true){
            while ( i <= r && array[i] < v)  i ++;
            while ( j>= l+1 && array[j] > v) j --;
            if(i > j) break;
            std::swap(array[i], array[j]);
            i ++;
            j --;
        }
        std::swap(array[l], array[j]);
        return j;
    }
    
    template<typename T>
    void quickSort(T array[], int l , int r){
        if(l >= r){
            return;
        }
        
        int p = partition(array, l, r);
        quickSort(array,l,p-1);
        quickSort(array,p+1,r);
    }
    
    template<typename T>
    void quickSort2(T array[], int l , int r){
        if(l >= r){
            return;
        }
        
        int p = partition2(array, l, r);
        quickSort2(array,l,p-1);
        quickSort2(array,p+1,r);
    }
    
    
    template<typename T>
    void quickSort3(T array[], int l, int r){
        if (l >= r) {
            return;
        }
        int p = partition3(array, l, r);
        quickSort3(array, l, p-1);
        quickSort3(array, p+1, r);
    }
    

    /**
     l                            i                  r
     _________________________________________________
     |   |          |           |   |      |         |
     | v |   < v    |   = v     | e |      |   > v   |
     |___|__________|___________|___|______|_________|
                  lt                        gt
     
     i 表示当前正在考虑的元素e索引
     lt 表示当前 <v 区域的最后一个元素索引
     gt 表示当前 >v 区域的第一个元素索引
     */
    template<typename T>
    void quickSort4(T array[], int l,  int r){
        if (l >= r) {
            return;
        }
        
        const int randomIndex = random() % (r -l +1) + l;
        std::swap(array[l], array[randomIndex]);
        T v = array[l];
        
        int i = l + 1;
        int lt = l;
        int gt = r + 1;
        
        while (i < gt) {
            if(array[i] < v){
                lt++;
                std::swap(array[i],array[lt]);
                i++;
            }
            else  if(array[i] > v){
                gt --;
                std::swap(array[i],array[gt]);
            }
            else { ///array[i] == v
                i++;
            }
        }
        
        std::swap(array[l],array[lt]);
        
        quickSort4(array, l, lt - 1);
        quickSort4(array, gt, r);
        
        
    }
    

    template<typename T>
    void quickSort(T array[], int n){
        quickSort(array,0, n-1);
    }
    
    template<typename T>
    void quickSort2(T array[], int n){
        srand((unsigned int)time(nullptr));
        quickSort2(array, 0,  n-1);
    }
    
    
    template<typename T>
    void quickSort3(T array[], int n){
        srand((unsigned int)time(nullptr));
        quickSort3(array, 0, n-1);
    }
    
    template<typename T>
    void quickSort4(T array[], int n){
        srand((unsigned int)time(nullptr));
        quickSort4(array, 0, n-1);
    }
}

#endif /* SortAlgorithm_hpp */
