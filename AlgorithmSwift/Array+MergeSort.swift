//
//  Array+MergeSort.swift
//  AlgorithmSwift
//
//  Created by zyz on 2016/11/4.
//  Copyright © 2016年 zyz. All rights reserved.
//

import Foundation

// 归并排序
extension Array {
    mutating func mergeSortBy(order: ((Element, Element) -> Bool)!) {
        if self.count <= 1 {
            return
        }
        
        var tempArray = Array<Element>()
        tempArray.append(contentsOf: self)
        
        // 合并函数
        func mergeSortedSubArray(lowIndex: Int, highIndex: Int) {
            if lowIndex >= highIndex {
                return
            }
            
            let midIndex = (highIndex + lowIndex) / 2
            
            var left = lowIndex
            var right = midIndex + 1
            
            // 将合并部分从self复制到temp上
            for i in lowIndex..<(highIndex + 1) {
                tempArray[i] = self[i]
            }
            
            // left和right是两个下标，它们将待排序的数组分开成左右两边，通过比较tempArray中left和right所指的元素的值，将较大/小替换掉原数组中的值
            for j in lowIndex..<(highIndex + 1) {
                if left > midIndex {    // 左边的值取完时，直接取右边的值替换self[j]
                    self[j] = tempArray[right]
                    right += 1
                    
                } else if right > highIndex {   // 右边的值取完时，直接取左边的值替换self[j]
                    self[j] = tempArray[left]
                    left += 1
                    
                } else if order!(tempArray[right], tempArray[left]) { // 比较左右两个值
                    self[j] = tempArray[right]
                    right += 1
                    
                } else {
                    self[j] = tempArray[left]
                    left += 1
                }
            }
        }
        
        // 将大数组分成小数组处理
        func sortSubArray(fromIndex: Int, toIndex: Int) {
            if fromIndex >= toIndex {
                return
            }
            
            // 数组最小为2个元素
            if toIndex - fromIndex < 2 {
                mergeSortedSubArray(lowIndex: fromIndex, highIndex: toIndex)
                return
                
            } else {
                let midIndex = Int((fromIndex + toIndex) / 2)
                sortSubArray(fromIndex: fromIndex, toIndex: midIndex)
                sortSubArray(fromIndex: midIndex + 1, toIndex: toIndex)
                
                mergeSortedSubArray(lowIndex: fromIndex, highIndex: toIndex)
            }
        }
        
        sortSubArray(fromIndex: 0, toIndex: self.count - 1)
    }
}













