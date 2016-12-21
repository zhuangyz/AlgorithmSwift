//
//  AlgorithmTimer.swift
//  AlgorithmSwift
//
//  Created by zyz on 16/11/2.
//  Copyright © 2016年 zyz. All rights reserved.
//

import UIKit

class AlgorithmTimer: NSObject {
    private var didStarted = false
    private var startTime : TimeInterval = 0
    private var endTime : TimeInterval = 0
    public var during : TimeInterval = 0
    
    public func startTimer() {
        if self.didStarted {
            return
        }
        
        self.startTime = Date().timeIntervalSince1970
        self.endTime = 0
        self.during = 0
        self.didStarted = true
    }
    
    public func endTimer() {
        if !self.didStarted {
            return
        }
        
        self.endTime = Date().timeIntervalSince1970
        self.during = self.endTime - self.startTime
        self.didStarted = false
    }
}
