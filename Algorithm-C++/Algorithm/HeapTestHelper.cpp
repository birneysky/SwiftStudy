//
//  HeapTestHelper.cpp
//  Algorithm
//
//  Created by birneysky on 2017/2/25.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#include "HeapTestHelper.hpp"
#include "MaxHeap.hpp"
#include <iostream>

void  HeapTestHelper::testHeap()
{
    int n = 100;
    MaxHeap<int> maxHeap = MaxHeap<int>(n);
    std::cout << "max heap size : " << maxHeap.size() << std::endl;
    
    srand((unsigned int)(time(NULL)));
    for( int i = 0; i <15; i++ ){
        maxHeap.insert(rand() % 100);
    }
    
    maxHeap.testPrint();
    maxHeap.extractMax();
    maxHeap.testPrint();
   // std::cout << "max heap size : " << maxHeap.size() << std::endl;
    
}
