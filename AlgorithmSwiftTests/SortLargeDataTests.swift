//
//  SortLargeDataTests.swift
//  AlgorithmSwift
//
//  Created by zyz on 16/11/2.
//  Copyright © 2016年 zyz. All rights reserved.
//

import XCTest

class SortLargeDataTests: XCTestCase {
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
        
        let nums = self.createUnorderNums(count: 1000000)
        
//        print("100000条原始数据\n\(nums)")
        print("原始数据创建完毕")
        
        self.numsForQS.append(contentsOf: nums)
        self.numsForBBS.append(contentsOf: nums)
        self.numsForSlS.append(contentsOf: nums)
        self.numsForIS.append(contentsOf: nums)
        self.numsForIS_faster.append(contentsOf: nums)
        self.numsForShS.append(contentsOf: nums)
        self.numsForMS.append(contentsOf: nums)
    }
    
    func createUnorderNums(count: Int) -> Array<Int> {
        var i = 0
        var nums = Array<Int>()
        let max = count * 100
        while i < count {
            let num : Int = Int(arc4random()) % max
            nums.append(num)
            i += 1
        }
        return nums
    }
    
    // 统一测试比较
    func testUnit() {
        // 0.11+-0.01秒左右，对于1000,0000条数据，快速排序也需要3分钟以上的处理时间
        self.testQuickSort()
        // 100条数据冒泡排序需要0.5秒，当10000条数据时，就已经需要38秒左右了
//        self.testBubbleSort()
        // 10000条数据时选择排序需要18秒左右
//        self.testSelectSort()
        // 对顺序随机的10000条数据，插入排序大概要23秒左右
//        self.testInsertSort()
        // 改进后的插入排序，对顺序随机的10000条数据，大概要17秒左右
//        self.testFasterInsertSort()
        // 0.23秒左右，非常快，(对于100,0000条数据，快速排序需要16秒左右，而希尔排序需要81秒)
//        self.testShellSort()
        // 0.16秒左右，也非常快，(对于100,0000条数据，快速排序需要16秒左右，而归并排序需要23秒左右，也挺快了)
        self.testMergeSort()
    }
    
    // 快速排序
    func testQuickSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForQS.quickSortBy(order: { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        })
        timer.endTimer()
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
//        print("希尔排序 排序后的数据\n\(self.numsForShS)")
        print("希尔排序 历时\(timer.during)秒")
    }
    
    // 归并排序
    func testMergeSort() {
        let timer = AlgorithmTimer()
        timer.startTimer()
        self.numsForMS.mergeSortBy { $0 < $1 }
        timer.endTimer()
//        print("归并排序 排序后的数据\n\(self.numsForMS)")
        print("归并排序 历时\(timer.during)秒")
    }
    
    // 测试对比 对于一个有序数组拼上一个小的无序数组时 快速排序、插入排序、希尔排序的性能对比
    func testContrastPartialOrder() {
        var orderedNums = self.createUnorderNums(count: 10000)
        orderedNums.quickSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        
        let unorderLettleNums = self.createUnorderNums(count: 10)
        orderedNums.append(contentsOf: unorderLettleNums)
        
        var numsForQS = Array<Int>(orderedNums)
        var numsForIS = Array<Int>(orderedNums)
        var numsForShS = Array<Int>(orderedNums)
        print("开始")
        
        // 快速排序
        let timer = AlgorithmTimer()
        timer.startTimer()
        numsForQS.quickSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
        print("快速排序 历时\(timer.during)秒")
        
        // 插入排序
        timer.startTimer()
        numsForIS.insertSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
        print("插入排序 历时\(timer.during)秒")
        
        // 希尔排序
        timer.startTimer()
        numsForShS.shellSortBy { (num1: Int, num2: Int) -> Bool in
            return num1 < num2
        }
        timer.endTimer()
        print("希尔排序 历时\(timer.during)秒")
        
        // 测试结果：快速排序平均使用8+-1秒的时间，而插入排序和希尔排序平均仅仅使用0.05秒左右，对于有序数组+无序小数组，插入排序效率要明显高于快速排序
    }
}

























