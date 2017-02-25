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
    MaxHeap<int> maxHeap = MaxHeap<int>(100);
    std::cout << "max heap size : " << maxHeap.size() << std::endl;
}
