//
//  DecayCounter.swift
//  half-life-equation
//
//  Created by Mark Hamilton on 6/19/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import Foundation

public class DecayCounter {
    
    private var value: Float
    private var time: NSDate
    private var tau: Float
    
    public convenience init?(halfLife: Float) {
        
        self.init(halfLife, 0.0)
        
    }
    
    public init(_ halfLife: Float, _ initialValue: Float) {
        
        self.value = initialValue
        self.time = NSDate()
        self.tau = halfLife / log(2.0)
        
    }
    
    public func set(newValue: Float) {
        
        self.value = newValue
        self.time = NSDate()
        
    }
    
    public func get() -> Float {
        
        update()
        
        return self.value
        
    }
    
    public func increment() -> Float {
        
        update()
        
        value += 1.0
        return value
        
    }
    
    private func update() {
        
        let newTime: NSDate = NSDate()
        let deltaTime: NSTimeInterval = time.timeIntervalSinceDate(newTime)
        
        if (deltaTime > 0) {
            
            let exponentValue: Float = Float(deltaTime) * -0.001 / self.tau
            
            value *= exp(exponentValue)
            
            self.time = newTime
            
        }
        
    }
    
}