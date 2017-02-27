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
#include "BSTTestHelper.hpp"
#include "BinarySearchTestHelper.hpp"
#include "HeapTestHelper.hpp"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int n = 1000000;
        //int* randomArray = SortTestHelper::generateRandomArray(n, 0, 10);
        int* randomArray = SortTestHelper::generateNearlyOrderedArray(n, 20);
        int* copyArray = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray2 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray3 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray4 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray5 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray6 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray7 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray8 = SortTestHelper::copyIntArray(randomArray, n);
        int* copyArray9 = SortTestHelper::copyIntArray(randomArray, n);
        
//        SortTestHelper::testSort("SelectionSort", SortAlgorigthm::selectionSort, randomArray, n);
//        SortTestHelper::testSort("InsertSort", SortAlgorigthm::insertSort, copyArray, n);
//        SortTestHelper::testSort("InsertSort2", SortAlgorigthm::insertSort2, copyArray2, n);
        SortTestHelper::testSort("InsertSort3", SortAlgorigthm::insertSort3, copyArray3, n);
        SortTestHelper::testSort("MergeSort", SortAlgorigthm::merageSort, copyArray4, n);
        
        //SortTestHelper::testSort("QuickSort", SortAlgorigthm::quickSort, copyArray5, n);
        //SortTestHelper::testSort("QuickSort2", SortAlgorigthm::quickSort2, copyArray6, n);
        SortTestHelper::testSort("QuickSort3", SortAlgorigthm::quickSort3, copyArray7, n);
        SortTestHelper::testSort("QuickSort4", SortAlgorigthm::quickSort4, copyArray8, n);
        SortTestHelper::testSort("MergeSortBottomToUp", SortAlgorigthm::merageSortBottomToUp, copyArray9, n);
        
        
        delete [] randomArray;
        delete [] copyArray;
        delete [] copyArray2;
        delete [] copyArray3;
        delete [] copyArray4;
        delete [] copyArray5;
        delete [] copyArray6;
        delete [] copyArray7;
        delete [] copyArray8;
    
        //BSTTestHelper::testBST();
        
        std::cout << std::endl << " ======= BST Test ======= " << std::endl;
        
        BSTTestHelper::testBSTTraversal();
        std::cout << std::endl;
        BSTTestHelper::testRemoveMin();
        std::cout << std::endl;
        BSTTestHelper::testRemoveMax();
        
        
        std::cout << std::endl << " ======= Binary Search Test ======= " << std::endl;
        BinarySearchTestHelper::testBinarySearch();
        
        std::cout << std::endl << " ======= Heap Test ======= " << std::endl;
        HeapTestHelper::testHeap();
    }
    return 0;
}
