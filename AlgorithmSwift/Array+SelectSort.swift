//
//  Array+SelectSort.swift
//  AlgorithmSwift
//
//  Created by zyz on 2016/11/3.
//  Copyright © 2016年 zyz. All rights reserved.
//

import Foundation

// 选择排序
extension Array {
    mutating func selectSortBy(order: ((Element, Element) -> Bool)!) {
        if self.count <= 1 {
            return
        }
        
        func sortSubArray(beginIndex: Int) {
            if beginIndex >= self.count {
                return
            }
            
            var exchangeIndex = beginIndex
            
            for i in beginIndex..<self.count {
                let shouldExchange = order!(self[exchangeIndex], self[i])
                if shouldExchange {
                    exchangeIndex = i
                }
            }
            let temp = self[beginIndex]
            self[beginIndex] = self[exchangeIndex]
            self[exchangeIndex] = temp
            
            sortSubArray(beginIndex: beginIndex + 1)
        }
        
        sortSubArray(beginIndex: 0)
    }
}
