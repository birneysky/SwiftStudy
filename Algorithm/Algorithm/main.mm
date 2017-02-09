//
//  main.m
//  Algorithm
//
//  Created by birneysky on 2017/1/31.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "SortTestHelper.hpp"
#include "SortAlgorithm.hpp"




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int n = 20;
        int* randomArray = SortTestHelper::generateRandomArray(n, 0, 20);
        //int* randomArray = SortTestHelper::generateNearlyOrderedArray(n, 10);
        int* copyArray = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray2 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray3 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray4 = SortTestHelper::copyIntArray(randomArray, n);
        
        //selectionSort(randomArray, n);
        //SortTestHelper::printArray(randomArray, n);
        
        SortTestHelper::testSort("SelectionSort", SortAlgorigthm::selectionSort, randomArray, n);
        SortTestHelper::testSort("InsertSort", SortAlgorigthm::insertSort, copyArray, n);
        SortTestHelper::testSort("InsertSort2", SortAlgorigthm::insertSort2, copyArray2, n);
        SortTestHelper::testSort("InsertSort3", SortAlgorigthm::insertSort3, copyArray3, n);
        SortTestHelper::testSort("MergeSort", SortAlgorigthm::merageSort, copyArray4, n);
        
        delete [] randomArray;
        delete [] copyArray;
        delete [] copyArray2;
        delete [] copyArray3;
        delete [] copyArray4;
    }
    return 0;
}
