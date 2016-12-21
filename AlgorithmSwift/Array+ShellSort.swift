//
//  Array+ShellSort.swift
//  AlgorithmSwift
//
//  Created by zyz on 2016/11/4.
//  Copyright © 2016年 zyz. All rights reserved.
//

import Foundation

/*
 *  希尔排序
 *  希尔排序将数组通过一个递增序列分成多个小数组，对这些小数组进行插入排序
 *  因此希尔排序也有插入排序的特点：对部分有序的数组效率更高。
 *  虽然希尔排序是在插入排序的基础上改进的，但是效率却提高了非常多
 * 
 *  这里的递增序列参考《算法》
 */
extension Array {
    mutating func shellSortBy(order: ((Element, Element) -> Bool)!) {
        if self.count <= 1 {
            return
        }
        
        var space = 1
        // 创建一个递增序列 1 4 13 40 ...
        while space < (self.count / 3) {
            space = space * 3 + 1
        }
        
        while space >= 1 {
            for i in space..<self.count {
                var j = i
                while j >= space && order!(self[j], self[j - space]) {
                    let temp = self[j]
                    self[j] = self[j - space]
                    self[j - space] = temp
                    
                    j -= space
                }
            }
            
            space = space / 3
        }
    }
}
















