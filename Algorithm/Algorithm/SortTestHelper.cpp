//
//  SortTestHelper.cpp
//  Algorithm
//
//  Created by birneysky on 2017/2/2.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#include "SortTestHelper.hpp"
#include <ctime>
#include <cstdlib>
#include <cassert>

int* SortTestHelper::generateRandomArray(int n, int rangeL, int rangeR){
    assert(rangeL <= rangeR);
    int* array = new int[n];
    srand((unsigned int)time(NULL));
    int range = rangeR - rangeL + 1;
    for (int i = 0; i < n; i++) {
        array[i] = rand() % range + rangeL;
    }
    return array;
}


int* SortTestHelper::copyIntArray( int a[], int n){
    int * arr = new int[n];
    memcpy(arr,a,n * sizeof(int));
    return  arr;
}

int* SortTestHelper::generateNearlyOrderedArray(int n, int swapTimes)
{
    int* arr = new int[n];
    for (int i = 0; i < n; i++) {
        arr[i] = i;
    }
    
    srand((unsigned int)time(NULL));
    
    for (int i = 0 ; i < swapTimes; i++) {
        int left = rand() % n ;
        int right = rand() % n ;
        std::swap(arr[left],arr[right]);
    }
    return arr;
    
}
