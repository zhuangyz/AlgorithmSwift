//
//  LCS.swift
//  AlgorithmSwift
//
//  Created by zyz on 16/11/1.
//  Copyright © 2016年 zyz. All rights reserved.
//

import UIKit

// 最长公共子序列
class LCS: NSObject {
    public class func getLCSFrom(strA:String, strB:String) -> String {
        // 将字符串转换为字符数组
        func getLettersFrom(str:String) -> [String] {
            var letters = [String]()
            for char in str.characters {
                letters.append(String(char))
            }
            return letters
        }
        var ALetters = getLettersFrom(str: strA)
        var BLetters = getLettersFrom(str: strB)
        
//        print("a letters : \(ALetters)")
//        print("b letters : \(BLetters)")
        
        // 定义一个数组，保存strA长度为i的子串和strB长度为j的子串之间的最大公共子序列的长度（从这个角度来看的话，这个算法好像可以用递归）
        // 这些长度的变化，也保存着最长公共子序列的信息
        // 所有数组元素初始化为0
        var lcsMaxLengths = [[Int]](repeating:[Int](repeating:0, count:BLetters.count + 1), count:ALetters.count + 1)
        
        // 计算最大公共子序列的长度
        for aIndex in 1..<ALetters.count + 1 {
            for bIndex in 1..<BLetters.count + 1 {
                if ALetters[aIndex - 1] == BLetters[bIndex - 1] {
                    lcsMaxLengths[aIndex][bIndex] = lcsMaxLengths[aIndex - 1][bIndex - 1] + 1
                    
                } else {
                    lcsMaxLengths[aIndex][bIndex] = max(lcsMaxLengths[aIndex][bIndex - 1], lcsMaxLengths[aIndex - 1][bIndex])
                }
            }
        }
        
//        // 打印长度数组
//        for lengths in lcsMaxLengths {
//            print(lengths)
//        }
        
        // 根据长度数组的变化取出最长公共子字符串
        var maxLength = lcsMaxLengths[ALetters.count][BLetters.count]
        var lcsStr = String()
        var aIndex = ALetters.count
        var bIndex = BLetters.count
        while maxLength > 0 {
            if lcsMaxLengths[aIndex][bIndex] != lcsMaxLengths[aIndex - 1][bIndex - 1] {
                // 两个字符相等，加入子序列中
                if lcsMaxLengths[aIndex - 1][bIndex] == lcsMaxLengths[aIndex][bIndex - 1] {
                    lcsStr = ALetters[aIndex - 1] + lcsStr
                    maxLength -= 1
                    aIndex -= 1
                    bIndex -= 1
                    
                } else {
                    // 取较大的数作为子字符串的最长公共子序列长度
                    lcsMaxLengths[aIndex - 1][bIndex] > lcsMaxLengths[aIndex][bIndex - 1] ? (aIndex -= 1) : (bIndex -= 1)
                }
                
            } else {
                aIndex -= 1
                bIndex -= 1
            }
        }
        
        return lcsStr
    }
}

























