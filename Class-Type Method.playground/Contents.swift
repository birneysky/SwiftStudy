//: Playground - noun: a place where people can play

import UIKit


/// type Method

class Matrix{
    var m: [[Int]]
    var row: Int
    var col: Int
    
    init?(_ arr2d:[[Int]]){
        guard arr2d.count > 0 else{
            return nil
        }
        
        let row = arr2d.count
        let col = arr2d[0].count
        for i in 1 ..<  row{
            if arr2d[i].count != col {
                return nil
            }
        }
        self.m = arr2d
        self.row = row
        self.col = col
    }
    
    func printMatrix(){
        for i in 0 ..< self.row{
            for j in 0 ..< self.col{
                print(self.m[i][j],terminator:"\t")
            }
            print()
        }
    }
    
    ///构建单位矩阵，主对角线元素都为1，其他元素均为0
    /// 创建单位矩阵这件事，与任何一个具体的矩阵都没有关系，而是于矩阵本身抽象的概念相关的
    /// 这种情况下，应该将这个方法定义为类型方法
    static func identityMatrix(n: Int) -> Matrix?{
        guard n > 0 else{
            return nil;
        }
        
//        if n <= 0 {
//            return nil
//        }
        
        var arr2d:[[Int]] = []
        for i in 0 ..< n{
            var row = [Int](repeating:0,count:n)
            row[i] = 1
            arr2d.append(row)
        }
        return Matrix(arr2d)
    }
}


if let matrix = Matrix([[2,3],[4,5]]) {
    matrix.printMatrix()
}

print("*********************************")

let e = Matrix.identityMatrix(n: 6);
e?.printMatrix()


///使用结构体来定义矩阵

struct Matrixs{
    var m: [[Int]]
    var row: Int
    var col: Int
    
    init?(_ arr2d:[[Int]]){
        guard arr2d.count > 0 else {
            return nil
        }
        
        let row = arr2d.count
        let col = arr2d[0].count
        for i in 1 ..< row{
            if arr2d[i].count != col {
                return nil
            }
        }
        
        self.m = arr2d
        self.row = row
        self.col = col;
    }
    
    
    func printMatrixs(){
        for i in 0 ..< self.row{
            for j in 0 ..< self.col{
                print(self.m[i][j], separator: "*", terminator: "\t")
            }
            print()
        }
    }
    
    static func identityMatrixs(n: Int) -> Matrixs?{
        guard n > 0 else {
            return nil
        }
        
        var arr2d:[[Int]] = []
        for i in 0 ..< n{
            var row = [Int](repeating:0,count:n)
            row[i] = 1
            arr2d.append(row)
        }
        
        return Matrixs(arr2d)
    }
    
}


let ms = Matrixs([[2,3],[4,5]])
ms?.printMatrixs()

let ms1 = Matrixs.identityMatrixs(n: 6)
ms1?.printMatrixs()

