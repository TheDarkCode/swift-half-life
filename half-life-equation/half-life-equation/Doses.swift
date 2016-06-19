//
//  Doses.swift
//  half-life-equation
//
//  Created by Mark Hamilton on 6/19/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public class Doses {
        
    var array: [DecayCounter]
    
    public init(arr: [DecayCounter]) {
        
        self.array = arr
        
    }
    
    public func getDoseAtCurrentTime() -> Float {
        
        var doseTotal: Float = 0.0
        
        for dose in array {
            
            doseTotal += dose.get()
            
        }
        
        return doseTotal
        
    }
    
}