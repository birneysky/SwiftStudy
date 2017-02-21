//
//  BST.hpp
//  Algorithm
//
//  Created by zhangguang on 17/2/21.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#ifndef BST_hpp
#define BST_hpp

#include <iostream>
/**
 二分搜索树
 每个节点的值大于它的左孩子，
 每个节点的值小于他的右孩子，
 以左右孩子为根的子树仍然是二分搜索树
 
 二分搜索树不一定的完全二叉树
 
       28
    /      \
   16      30
  /  \    /  \
 13  22  29  42
 
 Binery Search Tree
 
 */

template <typename Key, typename Value>
class BST{

private:
    struct Node{
        Node* left;
        Key  key;
        Value value;
        Node* right;
        
        Node(Key key, Value value){
            this->key = key;
            this->value = value;
            this->right = NULL;
            this->left = NULL;
        }
    };
    
    Node* root;
    int count;
    
private:
    
    /**
     向已node为根的二分搜索树中，插入节点（key,value),非递归的怎么写？
     
     @param node 根节点
     @param key key
     @param value value
     @return 返回插入新节点后的二分搜索树的根
     */
    Node* insert(Node* node, Key key, Value value){
        if (nullptr == node) {
            count ++;
            return new Node(key, value);
        }
        
        if (key == node->key) {
            node->value = value;
        }
        else if (key < node->key) {
            node->left = insert(node->left, key, value);
        }
        else{ // key > node->key
            node->right = insert(node->right, key, value);
        }
        
        return node;
    }
    
    /// 查看以node为根的二叉搜索树中，是否包含键值为key的节点
    bool contain(Node* node, Key key){
        if(nullptr == node){
            return false;
        }
        
        if (key == node->key) {
            return true;
        }
        else if( key > node->key){
            return contain(node->right, key);
        }
        else{ /// key < node->key
            return contain(node->left, key);
        }
    }
    
    ///在以node为根的二叉搜索树中查找key对应的value,失败返回null
    Value* search(Node* node, Key key){
        if(nullptr == node){
            return nullptr;
        }
        
        if(key == node->key){
            return &(node->value);
        }
        else if( key > node->key){
            return search(node->right, key);
        }
        else{/// key < node->key
            return search(node->left, key);
        }
    }
    
    ///对以node为根的二分搜索树进行前序遍历
    void preOrder(Node* node){
        if(nullptr != node){
            std::cout << node->key << " " ;
            preOrder(node->left);
            preOrder(node->right);
        }
    }
    
    ///对以node为根的二分搜索树进行中序遍历
    void inOrder(Node* node){
        if (nullptr != node) {
            inOrder(node->left);
            std::cout << node->key << " ";
            inOrder(node->right);
        }
    }
    
    ///对node为根的二分搜索树进行后续遍历
    void postOrder(Node* node){
        if (nullptr != node) {
            postOrder(node->left);
            postOrder(node->right);
            std::cout << node->key << " ";
        }
    }
    
    
    void destory(Node* node){
        if (nullptr != node) {
            destory(node->left);
            destory(node->right);
            
            delete node;
            count --;
        }
    }
    
public:
    BST(){
        root = nullptr;
        count = 0;
    }
    
    ~BST(){
        destory(root);
    }
    
    int size(){
        return count;
    }
    
    bool isEmpty(){
        return count == 0;
    }
    
    
    void insert(Key key, Value value){
        root = insert(root, key, value);
    }
    
    bool contain(Key key){
        return contain(root,key);
    }
    
    /// 返回Node* 暴露Node*，未对Node进行隐藏
    /// 返回Value，如果查找不到的话该怎么处理
    /// 返回Value* 未找到返回NULL,找到返回value的指针
    Value* search(Key key){
        return search(root,key);
    }
    
    ///前序遍历
    void preOrder(){
        preOrder(root);
    }
    
    ///中序遍历
    void inOrder(){
        inOrder(root);
    }
    
    ///后序遍历
    void postOrder(){
        postOrder(root);
    }
};

#endif /* BST_hpp */
