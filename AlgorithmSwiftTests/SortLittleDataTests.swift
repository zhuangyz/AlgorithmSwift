//
//  SortTests.swift
//  AlgorithmSwift
//
//  Created by zyz on 16/11/2.
//  Copyright © 2016年 zyz. All rights reserved.
//

import XCTest

class SortLittleDataTests: XCTestCase {
    var numsForQS = Array<Int>() // 快速排序
    var numsForBBS = Array<Int>() // 冒泡排序
    var numsForSlS = Array<Int>() // 选择排序
    var numsForIS = Array<Int>() // 插入排序
    var numsForIS_faster = Array<Int>() // 改进后的插入排序
    var numsForShS = Array<Int>() // 希尔排序
    var numsForMS = Array<Int>() // 归并排序
    
    override func setUp() {
        super.setUp()
        print("set up")
        
        var nums = Array<Int>()
        var i = 0
        while i < 10 {
            let num : Int = Int(arc4random()) % 1000
            nums.append(num)
            i += 1
        }
        
        print("10条原始数据\n\(nums)")
        
        self.numsForQS.append(contentsOf: nums)
        self.numsForBBS.append(contentsOf: nums)
        self.numsForSlS.append(contentsOf: nums)
        self.numsForIS.append(contentsOf: nums)
        self.numsForIS_faster.append(contentsOf: nums)
        self.numsForShS.append(contentsOf: nums)
        self.numsForMS.append(contentsOf: nums)
    }
    
    // 统一测试比较
    func testUnit() {
        self.testQuickSort()
        self.testBubbleSort()
        self.testSelectSort()
        self.testInsertSort()
        self.testFasterInsertSort()
        self.testShellSort()
        self.testMergeSort()
    }
    
    // 快速排序
    func testQuickSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForQS.quickSortBy() { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
        print("快速排序 排完序的数据\n\(self.numsForQS)")
        print("快速排序 历时\(timer.during)秒")
    }
    
    // 冒泡排序
    func testBubbleSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForBBS.bubbleSortBy() { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
//        print("冒泡排序 排完序的数据\n\(self.numsForBBS)")
        print("冒泡排序 历时\(timer.during)秒")
    }
    
    // 选择排序
    func testSelectSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForSlS.selectSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
//        print("选择排序 排完序的数据\n\(self.numsForBBS)")
        print("选择排序 历时\(timer.during)秒")
    }
    
    // 插入排序
    func testInsertSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForIS.insertSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
        print("插入排序 排完序的数据\n\(self.numsForIS)")
        print("插入排序 历时\(timer.during)秒")
    }
    
    // 改进后的插入排序
    func testFasterInsertSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForIS_faster.fasterInsertSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
        print("插入排序 排完序的数据\n\(self.numsForIS_faster)")
        print("改进后的插入排序 历时\(timer.during)秒")
    }
    
    // 希尔排序
    func testShellSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForShS.shellSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
        print("希尔排序 排序后的数据\n\(self.numsForShS)")
        print("希尔排序 历时\(timer.during)秒")
    }
    
    // 归并排序
    func testMergeSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForMS.mergeSortBy { $0 < $1 }
        timer.endTimer()
        print("归并排序 排序后的数据\n\(self.numsForMS)")
        print("归并排序 历时\(timer.during)秒")
    }
}



















