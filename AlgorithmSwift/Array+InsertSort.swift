//
//  Array+InsertSort.swift
//  AlgorithmSwift
//
//  Created by zyz on 2016/11/4.
//  Copyright © 2016年 zyz. All rights reserved.
//

import Foundation

// 插入排序
extension Array {
    mutating func insertSortBy(order: ((Element, Element) -> Bool)!) {
        if self.count <= 1 {
            return
        }
        
        func sortSubArray(currentIndex: Int) {
            if currentIndex > self.count - 1 {
                return
            }
            
            var i = currentIndex - 1
            let temp = self[currentIndex]
            while i >= 0 && order!(temp, self[i]) {
                self[i + 1] = self[i]
                self[i] = temp
                i -= 1
            }
            
            sortSubArray(currentIndex: currentIndex + 1)
        }
        
        sortSubArray(currentIndex: 1)
    }
    
    // 改进后的插入排序的差别在于 在while里，改进前的方法是元素位置交换，而改进后是直接让需要移动的大(小)数往后移动一个位置，而不是交换，减少了访问数组的次数
    mutating func fasterInsertSortBy(order: ((Element, Element) -> Bool)!) {
        if self.count <= 1 {
            return
        }
        
        func sortSubArray(currentIndex: Int) {
            if currentIndex > self.count - 1 {
                return
            }
            
            let temp = self[currentIndex]
            var i = currentIndex
            while i > 0 && order!(temp, self[i - 1]) {
                self[i] = self[i - 1]
                i -= 1
            }
            self[i] = temp
            
            sortSubArray(currentIndex: currentIndex + 1)
        }
        
        sortSubArray(currentIndex: 1)
    }
}












