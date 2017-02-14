//: Playground - noun: a place where people can play

import UIKit


/**
 下标
 */


var arr = [0,1,2,3,4,5]
arr[0]
arr[1]

var dic = ["北京":"beijing","上海":"shanghai","广州":"guangzhou","杭州":"hangzhou","成都":"chengdu"]
dic["北京"]

struct vector3{
    var x: Double = 0
    var y: Double = 0
    var z: Double = 0

    subscript(index: Int) -> Double?{
        get{
            switch index{
            case 0: return x
            case 1: return y
            case 2: return z
            default: return nil
            }
        }
        
        set{
            guard let  newValue = newValue else { return}
            switch index{
            case 0:  x = newValue
            case 1:  y = newValue
            case 2:  z = newValue
            default: return
            }
        }
    }
    
    subscript(axis: String) -> Double?{
        switch axis{
        case "x", "X": return x
        case "y", "Y": return y
        case "z", "Z": return z
        default: return nil
        }
    }
}


var v = vector3(x: 3.5, y: 2.8, z: 4)
v.x
v.y
v.z

v[0] = 100
v[0]
v["x"]
v["xxx"]



/**
 多维下标
 */



class Matrix{
    var data: [[Double]]
    var row: Int
    var col: Int
    
    init(row: Int, col: Int){
        self.row = row
        self.col = col
        self.data = [[Double]]()
        for _ in 0 ..< self.row{
            let arr = [Double](repeating:0, count:self.col)
            self.data.append(arr)
        }
    }
    
    
    subscript (x: Int, y: Int) -> Double{
        
        get{
            assert(x < self.col && x >= 0 && y < self.row && y >= 0,"Index Out of Range")
            return data[x][y]
        }
        
        set{
            assert(x < self.col && x >= 0 && y < self.row && y >= 0,"Index Out of Range")
            data[x][y] = newValue
        }
    }

    subscript (row: Int) -> [Double]{

        get{
            assert(row >= 0 && row < self.row, "Index Out of range")
            return self.data[row]
        }
        
        set{
            assert(newValue.count == self.col, "Column Number does not match")
            self.data[row] = newValue
        }
    }
}


var m = Matrix(row: 2, col: 2)

m[1,1]
m[0,1] = 2
//m[2,2]

m[0] = [0.0,3.5]
m[1][0]



