//
//  FileOps.cpp
//  Algorithm
//
//  Created by liuyubobobo on 8/28/16.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#include "FileOps.hpp"



size_t FileOps::firstCharacterIndex(const string& s, int start){
    for( int i = start ; i < s.length() ; i ++ )
        if( isalpha(s[i]) )
            return i;
    return s.length();
}

string FileOps::lowerS( const string& s){
    
    string ret = "";
    for( int i = 0 ; i < s.length() ; i ++ )
        ret += tolower(s[i]);
    return ret;
}

bool FileOps::readFile(const string& filename, vector<string> &words){
    
    string line;
    string contents = "";
    ifstream file(filename);
    if( file.is_open() ){
        while( getline(file, line))
            contents += ( line + "\n" );
        file.close();
    }
    else{
        cout<<"Can not open "<<filename<<" !!!"<<endl;
        return false;
    }
    
    size_t start = firstCharacterIndex(contents, 0);
    for( size_t i = start + 1 ; i <= contents.length() ; ){
        
        if( i == contents.length() || !isalpha(contents[i]) ){
            words.push_back( lowerS( contents.substr(start,i-start) ) );
            start = firstCharacterIndex(contents, (int)i);
            i = start + 1;
        }
        else{
            i ++;
        }
    }
    
    return true;
}
