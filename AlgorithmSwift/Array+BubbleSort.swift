//
//  Array+BubbleSort.swift
//  AlgorithmSwift
//
//  Created by zyz on 16/11/2.
//  Copyright © 2016年 zyz. All rights reserved.
//

import Foundation

// 冒泡排序
extension Array {
    mutating func bubbleSortBy(order: ((Element, Element) -> Bool)!) {
        if self.count <= 1 {
            return
        }
        
        func sortSubArray(unorderLenght: Int) {
            if unorderLenght <= 1 {
                return
            }
//            print("unorderLenght: \(unorderLenght)")
            
            var leftIndex = 0
            var rightIndex = 1
            
            while rightIndex < unorderLenght {
                let shouldExchange = order!(self[rightIndex], self[leftIndex])
                if shouldExchange {
                    let temp = self[leftIndex]
                    self[leftIndex] = self[rightIndex]
                    self[rightIndex] = temp
                }
                
                leftIndex += 1
                rightIndex += 1
            }
            
            sortSubArray(unorderLenght: unorderLenght - 1)
        }
        
        sortSubArray(unorderLenght: self.count)
    }
}
