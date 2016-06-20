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
    private var time: Date
    private var tau: Float
    private var numHalfLives: Int = 0
    
    public convenience init?(_ halfLife: Float) {
        
        self.init(halfLife, 0.0)
        
    }
    
    public convenience init?(_ halfLife: Float, _ initialValue: Float, _ hLives: Int) {
        
        self.init(halfLife, initialValue)
        self.numHalfLives = hLives
        self.updateForHalfLives()
    }
    
    public init(_ halfLife: Float, _ initialValue: Float) {
        
        self.value = initialValue
        self.time = Date()
        self.tau = halfLife / log(2.0)
        
    }
    
    public func set(_ newValue: Float) {
        
        self.value = newValue
        self.time = Date()
        
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
    
    public func performHalf() {
        
        self.set((self.value/2))
        
    }
    
    public func incrementHalfLives() {
        
        self.numHalfLives += 1
        
    }
    
    private func update() {
        
        let newTime: Date = Date()
        let deltaTime: TimeInterval = time.timeIntervalSince(newTime)
        
        if (deltaTime > 0) {
            
            let exponentValue: Float = Float(deltaTime) * -0.001 / self.tau
            
            value *= exp(exponentValue)
            
            self.time = newTime
            
        }
        
    }
    
    private func updateForHalfLives() {
        
        for _ in 1...self.numHalfLives where self.numHalfLives > 0 {
            
            self.performHalf()
            
        }
        
    }
    
}
