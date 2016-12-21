//
//  BinaryHeap.swift
//  AlgorithmSwift
//
//  Created by zyz on 2016/11/15.
//  Copyright © 2016年 zyz. All rights reserved.
//

import UIKit

typealias OrderClosure = (_ obj1: AnyObject, _ obj2: AnyObject) -> Bool

class BinaryHeap: NSObject {
    var queue : Array<AnyObject>!
    var order : OrderClosure!
    
    override init() {
        self.queue = Array<AnyObject>()
        self.order = {(obj1: AnyObject, obj2: AnyObject) -> Bool in
            return false
        }
    }
    
    func insert(obj: AnyObject) -> Void {
        self.queue.append(obj)
        self.swim(subNodeIndex: self.queue.count - 1)
        
//        self.printQueue()
    }
    
    func pushTop() -> AnyObject? { // 返回类型后面加上？之后才能返回nil
        if self.queue.count == 0 {
            return nil
        }
        
        let top = self.queue[0]
        self.queue[0] = self.queue[self.queue.count - 1]
        self.queue.remove(at: self.queue.count - 1)
        
        self.sink(parentNodeIndex: 0, count: self.queue.count)
        
        return top
    }
    
    // 上浮
    private func swim( subNodeIndex: Int) -> Void {
        let parentNodeIndex = (subNodeIndex - 1) / 2
        
        if subNodeIndex > 0 {
            let shouldExchage = self.order(self.queue[subNodeIndex], self.queue[parentNodeIndex])
            if shouldExchage {
                self.exchange(index1: parentNodeIndex, index2: subNodeIndex)
                swim(subNodeIndex: parentNodeIndex)
            }
        }
    }
//    // 上浮
//    private func swim( subNodeIndex: Int) -> Void {
//        var subNodeIndex = subNodeIndex
//        while subNodeIndex > 0 {
//            let parentNodeIndex = (subNodeIndex - 1) / 2
//            let shouldExchange = self.order(self.queue[subNodeIndex], self.queue[parentNodeIndex])
//            
//            if shouldExchange {
//                self.exchange(index1: parentNodeIndex, index2: subNodeIndex)
//                subNodeIndex = parentNodeIndex
//            } else {
//                break
//            }
//        }
//    }
    
    // 下沉
    private func sink( parentNodeIndex: Int, count: Int) -> Void {
        let subNodeL = (parentNodeIndex + 1) * 2 - 1
        if subNodeL >= count {
            return
        }
        
        let subNodeR = subNodeL + 1
        var willExchangeNodeIndex = subNodeL
        
        if subNodeR < count && self.order(self.queue[subNodeR], self.queue[subNodeL]) {
            willExchangeNodeIndex = subNodeR
        }
        if !self.order(self.queue[willExchangeNodeIndex], self.queue[parentNodeIndex]) {
            return
        }
        self.exchange(index1: parentNodeIndex, index2: willExchangeNodeIndex)
        
//        self.printQueue()
        self.sink(parentNodeIndex: willExchangeNodeIndex, count: count)
    }
//    // 下沉
//    private func sink( parentNodeIndex: Int, count: Int) {
//        var parentNodeIndex = parentNodeIndex
//        var subNodeL = (parentNodeIndex + 1) * 2 - 1
//        
//        while subNodeL < count {
//            let subNodeR = subNodeL + 1
//            var willExchangeNodeIndex = subNodeL
//            
//            if subNodeR < count && self.order(self.queue[subNodeR], self.queue[subNodeL]) {
//                willExchangeNodeIndex = subNodeR
//            }
//            if !self.order(self.queue[willExchangeNodeIndex], self.queue[parentNodeIndex]) {
//                break
//            }
//            self.exchange(index1: willExchangeNodeIndex, index2: parentNodeIndex)
//            
//            parentNodeIndex = willExchangeNodeIndex
//            subNodeL = (parentNodeIndex + 1) * 2 - 1
//        }
//    }
    
    private func exchange( index1: Int, index2: Int) -> Void {
        let temp = self.queue[index1]
        self.queue[index1] = self.queue[index2]
        self.queue[index2] = temp
    }
    
    func printQueue() -> Void {
        print("")
        
        var i: Int = 0
        var floor = 0.0
        
        while i < self.queue.count {
            let printCount = Int(pow(2.0, floor))
            for _ in 0..<printCount {
                if i >= self.queue.count {
                    print("\n")
                    return
                }
                
                print("\(self.queue[i]) ", separator: " ", terminator: "")
                if i % 2 == 0 {
                    print("| ", separator: " ", terminator: "")
                }
                i += 1
            }
            
            print("")
            floor += 1
        }
        print("\n")
    }
    
    init(array: Array<AnyObject>!, order: @escaping OrderClosure) {
        super.init()
        
        self.queue = array
        self.order = order
        
        self.buildBinaryHeap()
    }
    
    func buildBinaryHeap() {
        var beginIndex = self.queue.count / 2 - 1
//        let timer = AlgorithmTimer()
        
        while beginIndex >= 0 {
//            timer.startTimer()
            self.sink(parentNodeIndex: beginIndex, count: self.queue.count)
//            timer.endTimer()
//            print("\(beginIndex) 下沉历时:\(timer.during)秒")
            
            if beginIndex == 0 {
                break
            }
            beginIndex -= 1
        }
    }
    
    func sort() {
        var count = self.queue.count
        while count > 0 {
            self.exchange(index1: 0, index2: count - 1)
            count -= 1
            self.sink(parentNodeIndex: 0, count: count)
        }
    }
}

















