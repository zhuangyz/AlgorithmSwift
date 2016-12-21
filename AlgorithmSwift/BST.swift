//
//  BST.swift
//  AlgorithmSwift
//
//  Created by zyz on 2016/11/23.
//  Copyright © 2016年 zyz. All rights reserved.
//

import Foundation

class BST: NSObject {
    
    private class Node: NSObject {
        var left: Node?
        var right: Node?
        var length: Int = 0
        
        init(left: Node, right:Node, length: Int) {
            self.left = left
            self.right = right
            self.length = length
        }
    }
    
    public func setObject(obj: AnyObject, forKey: String) {
        
    }
    
    public func getObjectWith(key: String) -> AnyObject? {
        return nil
    }
    
    public func remove(key: String) {
        
    }
}
