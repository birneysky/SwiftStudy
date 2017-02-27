//
//  BirneySearchAlgorithm.hpp
//  Algorithm
//
//  Created by birneysky on 2017/2/25.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#ifndef BirneySearchAlgorithm_hpp
#define BirneySearchAlgorithm_hpp

#include <stdio.h>


namespace BinarySearchAlgorithm {
    

    
    
    /**
     对于有序数列，才能使用二分查找法。
     _________________________________________
     |                 |   |                 |
     |     <v          | v |      >v         |
     |_________________|___|_________________|

     @param array 数组地址
     @param l left index
     @param r right index;
     @param v 需要查找的值
     @return 返回值对应的索引，如果没找到返回-1
     */
    template<typename T>
    int binarySearchRecursion(T array[], int l, int r, int v ){
        
        if(l>=r){
            return -1;
        }
        int m = (r-l +1 )/ 2 + l;
        
        if (array[m] == v) {
            return m;
        }
        else if(v > array[m]){
            return binarySearchRecursion(array, m+1, r, v);
        }
        else{
           return  binarySearchRecursion(array, l, m-1, v);
        }
    }
    
    
    template<typename T>
    int binarySearch(T array, int n, int target){
        
        int l = 0, r = n-1;
        
        while(l<=r){
            int m =  (r-l) / 2 + l;
            if (array[m] == target) {
                return m;
            }
            
            if(target > array[m] ) {
                l = m + 1;
            }
            else{
                r = m - 1;
            }
        }
        
        return -1;
    }
    
    
}


#endif /* BirneySearchAlgorithm_hpp */
