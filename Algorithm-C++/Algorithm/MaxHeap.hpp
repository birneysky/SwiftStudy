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
#include <cmath>
#include <string>
#include <cstring>
using namespace std;

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
    
    void shiftDown(int k){
        ///保证索引为k的节点应该有左孩子
        while (2 * k <= count) {
            int j = 2 * k;
            if(j+1 <= count && data[j] < data[j+1]){
                j += 1;
            }
            
            if(data[k] > data[j]) break;
            std::swap(data[k], data[j]);
            k = j;
        }
    }
    
    void putNumberInLine( int num, string &line, int index_cur_level, int cur_tree_width, bool isLeft){
        
        int sub_tree_width = (cur_tree_width - 1) / 2;
        int offset = index_cur_level * (cur_tree_width+1) + sub_tree_width;
        assert(offset + 1 < line.size());
        if( num >= 10 ) {
            line[offset + 0] = '0' + num / 10;
            line[offset + 1] = '0' + num % 10;
        }
        else{
            if( isLeft)
                line[offset + 0] = '0' + num;
            else
                line[offset + 1] = '0' + num;
        }
    }
    
    void putBranchInLine( string &line, int index_cur_level, int cur_tree_width){
        
        int sub_tree_width = (cur_tree_width - 1) / 2;
        int sub_sub_tree_width = (sub_tree_width - 1) / 2;
        int offset_left = index_cur_level * (cur_tree_width+1) + sub_sub_tree_width;
        assert( offset_left + 1 < line.size() );
        int offset_right = index_cur_level * (cur_tree_width+1) + sub_tree_width + 1 + sub_sub_tree_width;
        assert( offset_right < line.size() );
        
        line[offset_left + 1] = '/';
        line[offset_right + 0] = '\\';
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
    
    Item extractMax(){
        assert(count > 0);
        Item result = data[1];
        std::swap(data[1], data[count]);
        
        count --;
        shiftDown(1);
        
        return result;
    }
    
    void testPrint(){
        
        if( size() >= 100 ){
            cout<<"Fancy print can only work for less than 100 int";
            return;
        }
        
        if( typeid(Item) != typeid(int) ){
            cout <<"Fancy print can only work for int item";
            return;
        }
        
        cout<<"The Heap size is: "<<size()<<endl;
        cout<<"data in heap: ";
        for( int i = 1 ; i <= size() ; i ++ )
            cout<<data[i]<<" ";
        cout<<endl;
        cout<<endl;
        
        int n = size();
        int max_level = 0;
        int number_per_level = 1;
        while( n > 0 ) {
            max_level += 1;
            n -= number_per_level;
            number_per_level *= 2;
        }
        
        int max_level_number = int(pow(2, max_level-1));
        int cur_tree_max_level_number = max_level_number;
        int index = 1;
        for( int level = 0 ; level < max_level ; level ++ ){
            string line1;// = string(max_level_number*3-1, ' ');
            line1.append(max_level_number*3-1, ' ');
            int cur_level_number = min(count-int(pow(2,level))+1,int(pow(2,level)));
            bool isLeft = true;
            for( int index_cur_level = 0 ; index_cur_level < cur_level_number ; index ++ , index_cur_level ++ ){
                putNumberInLine( data[index] , line1 , index_cur_level , cur_tree_max_level_number*3-1 , isLeft );
                isLeft = !isLeft;
            }
            cout<<line1<<endl;
            
            if( level == max_level - 1 )
                break;
            
            string line2(max_level_number*3-1, ' ');// = string(max_level_number*3-1, ' ');
            //line2.append(max_level_number*3-1, ' ');
            for( int index_cur_level = 0 ; index_cur_level < cur_level_number ; index_cur_level ++ )
                putBranchInLine( line2 , index_cur_level , cur_tree_max_level_number*3-1 );
            cout<<line2<<endl;
            
            cur_tree_max_level_number /= 2;
        }
    }
    
};


#endif /* MaxHeap_hpp */
