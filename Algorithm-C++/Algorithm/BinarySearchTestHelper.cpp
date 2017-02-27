//
//  BinarySearchTestHelper.cpp
//  Algorithm
//
//  Created by birneysky on 2017/2/25.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#include "BinarySearchTestHelper.hpp"
#include "BinarySearchAlgorithm.hpp"
#include <iostream>

int* BinarySearchTestHelper::generateOrderedArray(int n ){
    int* array = new int[n];
    for (int i = 0; i < n; i++) {
        array[i] = i;
    }
    return array;
}

void BinarySearchTestHelper::testBinarySearch()
{
    int n = 10000000;
    int* orderedArray = generateOrderedArray(n);
    
    int index1 = BinarySearchAlgorithm::binarySearch(orderedArray, n, 100);
    int index2 = BinarySearchAlgorithm::binarySearchRecursion(orderedArray, 0, n - 1, 100);
    
    std::cout << "binary search : " <<  orderedArray[index1] << "---" << orderedArray[index2]  << std::endl;
    
    delete [] orderedArray;
}
