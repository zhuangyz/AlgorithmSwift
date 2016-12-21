//
//  PQTests.swift
//  AlgorithmSwift
//
//  Created by zyz on 2016/11/15.
//  Copyright © 2016年 zyz. All rights reserved.
//

import XCTest

class PQTests: XCTestCase {
    var pq = BinaryHeap()
    
    override func setUp() {
        super.setUp()
        
        self.pq.order = {(num1: AnyObject, num2: AnyObject) -> Bool in
            return (num1 as! NSNumber).intValue < (num2 as! NSNumber).intValue
        }
    }
    
    func testRepeat() {
        for _ in 0..<100 {
//            self.testExample()
//            self.testBuildHeap()
            self.testFast()
            print("")
        }
    }
    
    // 测试结果，对于10,0000条数据，插入这些数据只需要18秒左右，而出队列则需要30秒左右
    func testExample() {
        var i = 0
        while i < 100000 {
            let num : Int = Int(arc4random()) % 1000000
//            print("\(num)  ", terminator: "")
            
            self.pq.insert(obj: NSNumber(value: num))
            
            i += 1
        }
        print("\n--------------------------")
        
        var num = self.pq.pushTop()
        var lastNum = INT_LEAST16_MIN
        while num != nil {
            assert(lastNum <= (num as! NSNumber).int32Value)
            
//            print("\(num!)  ", terminator: "")
            
            lastNum = (num as! NSNumber).int32Value
            num = self.pq.pushTop()
        }
        print("\n===========================\n")
    }
    
    // 10,0000测试结果，建堆时间530秒，排序时间只要3.5秒
    func testBuildHeap() {
        var nums = Array<Int>()
        var i = 0
        while i < 100000 {
            let num : Int = Int(arc4random()) % 100000
            nums.append(num)
            i += 1
        }
        
        let timer = AlgorithmTimer()
        timer.startTimer()
        let pq = BinaryHeap(array: nums as Array<AnyObject>!, order: {(num1: AnyObject, num2: AnyObject) -> Bool in
            return (num1 as! NSNumber).intValue < (num2 as! NSNumber).intValue
        })
        timer.endTimer()
        print("建堆历时 \(timer.during)秒")
        
        timer.startTimer()
        pq.sort()
        timer.endTimer()
        print("排序历时 \(timer.during)秒")
        
//        print(pq.queue)
        for i in 1..<pq.queue.count {
            assert((pq.queue[i - 1] as! Int) >= (pq.queue[i] as! Int))
        }
    }
    
    // 对于10,0000条数据，插入数据需要18+-2秒左右，排序只需要3秒左右
    func testFast() {
        let pq = BinaryHeap()
        pq.order = {(num1: AnyObject, num2: AnyObject) -> Bool in
            return (num1 as! NSNumber).intValue < (num2 as! NSNumber).intValue
        }
        
        let timer = AlgorithmTimer()
        timer.startTimer()
        
        var i = 0
        while i < 100000 {
            let num : Int = Int(arc4random()) % 100000
//            print("\(num)  ", terminator: "")
            
            pq.insert(obj: NSNumber(value: num))
            
            i += 1
        }
        timer.endTimer()
        print("建堆历时 \(timer.during)秒")
        
        timer.startTimer()
        pq.sort()
        timer.endTimer()
        print("排序历时 \(timer.during)秒")
        
//        print(pq.queue)
        for i in 1..<pq.queue.count {
            assert((pq.queue[i - 1] as! Int) >= (pq.queue[i] as! Int))
        }
    }
}

















