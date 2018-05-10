//
//  UnitTest.swift
//  UnitTest
//
//  Created by birneysky on 2018/4/12.
//  Copyright © 2018年 com.Tech. All rights reserved.
//

import XCTest

class SortUnitTest: XCTestCase {
    
    /// 生成有n个元素的随机数组，每个元素的随机范围为[rangeL,rangeR]
    ///
    /// - Parameters:
    ///   - n: 数组长度
    ///   - rangeL: 左侧区间值
    ///   - rangeR: 右侧区间值
    /// - Returns: 随机数组
    class func  generateRandomIntArray(n: Int, rangeL: Int, rangeR: Int) -> [Int]{
        assert(rangeL <= rangeR)
        let range = rangeR - rangeL + 1
        var array = [Int]()
        for _ in 0 ..< n{
            array.append(Int(arc4random()) % range + rangeL)
        }
        return array
    }

    static func isSorted<T:Comparable>(_ array:[T]) -> Bool{
        let n = array.count - 1
        for i in 0 ..< n{
            if array[i] > array[i+1] {
                return false
            }
        }
        return true
    }
    
    //class var randomArray:[Int] {}
    let n:Int = 10000
    var randomArray:[Int]?
    override func setUp() {
        super.setUp()
        randomArray =  SortUnitTest.generateRandomIntArray(n: n, rangeL: 0, rangeR: n)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSelectSort() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       selectSort(array: &randomArray!)
        //let a = UnionFindA(5)
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }

    func testInsertSort() {
        insertSort(array: &randomArray!)
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }

    func testInsertSort2() {
        insertSort2(array: &randomArray!)
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }
    
    func testPerformanceSelectSort() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            selectSort(array: &self.randomArray!)
        }
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }
    
    func testQuickSort() {
        quickSort(array: &randomArray!)
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }
    
    func testMergeSort() {
        mergeSort(array: &randomArray!)
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }
    
    func testPerformanceQuickSort() {
        self.measure {
            quickSort(array: &randomArray!)
        }
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }
    
    func testPerformanceMergeSort() {
        self.measure {
            mergeSort(array: &randomArray!)
        }
        XCTAssert(SortUnitTest.isSorted(randomArray!))
    }
    
}
