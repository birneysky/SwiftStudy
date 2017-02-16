//
//  SortTestHelper.hpp
//  Algorithm
//
//  Created by birneysky on 2017/2/2.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#ifndef SortTestHelper_hpp
#define SortTestHelper_hpp

#include <stdio.h>
#include <iostream>
#include <cstdlib>

namespace SortTestHelper {
    /**
     /生成有n个元素的随机数组，每个元素的随机范围为[rangeL,rangeR]


     @param n 数组长度
     @param rangeL 左侧区间值
     @param rangeR 右侧区间值
     @return 数组指针
     */
    int* generateRandomArray(int n, int rangeL, int rangeR);
    
    /**
     生成有n个元素的近乎有序的随机数组

     @param n 数组长度
     @param swapTimes 交换次数
     @return 数组指针
     */
    int* generateNearlyOrderedArray(int n, int swapTimes);

    int* copyIntArray( int a[], int n);
    
    template<typename T>
    void printArray(T arr[], int n){
        for( int i = 0; i < n; i++){
            std::cout << arr[i] << " ";
        }
        std::cout << std::endl;
    }
    
    template<typename T>
    bool isSorted(T arr[], int n){
        for (int i = 0; i < n - 1; i++) {
            if (arr[i] > arr[i+1]) {
                return false;
            }
        }
        return true;
    }
    
    template<typename T>
    void testSort(std::string sortName,void(*sort)(T[], int),T arr[], int n){
        clock_t startTime = clock();
        sort(arr,n);
        clock_t endTime = clock();
        assert( isSorted(arr, n) );
        std::cout << sortName << " : " << double(endTime - startTime) / CLOCKS_PER_SEC << " s " << std::endl;
    }

}

#endif /* SortTestHelper_hpp */
