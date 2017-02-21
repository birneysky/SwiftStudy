//
//  FileOps.hpp
//  Algorithm
//
//  Created by liuyubobobo on 8/28/16.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#ifndef FileOps_hpp
#define FileOps_hpp

#include <string>
#include <iostream>
#include <fstream>
#include <vector>

using namespace std;


namespace FileOps{
    
    size_t firstCharacterIndex(const string& s, int start);
    
    string lowerS( const string& s);
    bool readFile(const string& filename, vector<string> &words);
}

#endif /* FileOps_hpp */
