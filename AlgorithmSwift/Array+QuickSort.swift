//
//  Array+QuickSort.swift
//  AlgorithmSwift
//
//  Created by zyz on 16/11/2.
//  Copyright © 2016年 zyz. All rights reserved.
//

import Foundation

/*
 *  快速排序
 *  通过选择一个哨兵（参考值），将数组的所有值按照比哨兵值大或小分成两组，然后对这两个子数组再重复刚才的操作，这里选择首个元素作为哨兵（虽然这里写得很不明显）
 */
extension Array {
    mutating func quickSortBy(order: ((Element, Element) -> Bool)!) {
        if self.count <= 1 {
            return
        }
        
        func sortSubArray(leftIndex: Int, rightIndex: Int) {
            if leftIndex >= rightIndex {
                return
            }
            
            // 选定两个可移动的桩（下标）
            var varLeftIndex = leftIndex
            var varRightIndex = rightIndex
            // 标记当前应该移动的桩
            var shouldMoveRightIndex = true
            
            while varLeftIndex < varRightIndex {
                let shouldExchange = order!(self[varRightIndex], self[varLeftIndex])
                if shouldExchange {
                    let temp = self[varLeftIndex]
                    self[varLeftIndex] = self[varRightIndex]
                    self[varRightIndex] = temp
                    
                    shouldMoveRightIndex = !shouldMoveRightIndex
                }
                shouldMoveRightIndex ? (varRightIndex -= 1) : (varLeftIndex += 1)
            }
            
            let referIndex = shouldMoveRightIndex ? varLeftIndex : varRightIndex
            sortSubArray(leftIndex: leftIndex, rightIndex: referIndex - 1)
            sortSubArray(leftIndex: referIndex + 1, rightIndex: rightIndex)
        }
        
        sortSubArray(leftIndex: 0, rightIndex: self.count - 1)
    }
    // 扩展方法不需要加public关键字!？
    // mutating 在扩展或协议中，只有在mutating关键字修饰的实例方法里才能修改自身的属性值
    // 闭包被@noescape修饰, 则声明闭包的生命周期不能超过当前的方法, 并且, 闭包不能被方法中的其他闭包捕获
}















