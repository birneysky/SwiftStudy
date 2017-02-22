//
//  BSTTestHelper.cpp
//  Algorithm
//
//  Created by zhangguang on 17/2/21.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#include "BSTTestHelper.hpp"
#include "FileOps.hpp"
#include "SequenceST.hpp"
#include "BST.hpp"



void BSTTestHelper::testBST()
{
    string filename = "bible.txt";
    
    vector<string> words;
    if( FileOps::readFile(filename, words) ) {
        
        cout << "There are totally " << words.size() << " words in " << filename << endl;
        
        cout << endl;
        
        
        // test BST
        time_t startTime = clock();
        BST<string, int> bst = BST<string, int>();
        for (vector<string>::iterator iter = words.begin(); iter != words.end(); iter++) {
            int *res = bst.search(*iter);
            if (res == NULL)
                bst.insert(*iter, 1);
            else
                (*res)++;
        }
        
        cout << "'god' : " << *bst.search("god") << endl;
        time_t endTime = clock();
        cout << "BST , time: " << double(endTime - startTime) / CLOCKS_PER_SEC << " s." << endl;
        
        cout << endl;
        
        
        // test SST
        startTime = clock();
        SequenceST<string, int> sst = SequenceST<string, int>();
        for (vector<string>::iterator iter = words.begin(); iter != words.end(); iter++) {
            int *res = sst.search(*iter);
            if (res == NULL)
                sst.insert(*iter, 1);
            else
                (*res)++;
        }
        
        cout << "'god' : " << *sst.search("god") << endl;
        
        endTime = clock();
        cout << "SST , time: " << double(endTime - startTime) / CLOCKS_PER_SEC << " s." << endl;
        
    }
}


void BSTTestHelper::testBSTTraversal()
{
    int array[] = {28,16,30,13,22,29,42};
    int n = sizeof(array) / sizeof(int);
    BST<int,string> bst;
    
    for( int i = 0 ; i < n; i++){
        char buf[10] = {};
        sprintf(buf, "%d",array[i]);
        bst.insert(array[i], std::string(buf));
    }
    
    cout << "BST level order: ";
    bst.levelOrder();
    cout << endl;
    
    cout << "BST post order: ";
    bst.postOrder();
    cout << endl;
    
    
    cout << "BST in Order: ";
    bst.inOrder();
    cout << endl;
    
    cout << "BST previous Order: ";
    bst.preOrder();
    cout << endl;
    
    cout << "BST minmum: " << bst.minimum() << endl;
    
    cout << "BST maxmum: " << bst.maxmum() << endl;
}
