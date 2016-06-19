//: Playground - noun: a place where people can play

import UIKit

public class DecayCounter {
    
    private var value: Float
    private var time: NSDate
    private var tau: Float
    private var numHalfLives: Int = 0
    
    public convenience init?(halfLife: Float) {
        
        self.init(halfLife, 0.0)
        
    }
    
    public convenience init?(halfLife: Float, _ initiaValue, _ hLives: Int) {
        
        self.init(halfLife, initialValue)
        self.numHalfLifes = hLifes
        self.updateForHalfLives()
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
    
    public func performHalf() {
        
        self.set((self.value/2))
        
    }
    
    public func incrementHalfLives() {
        
        self.numHalfLives += 1
        
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
    
    private func updateForHalfLives() {
        
        for 1...numHalfLives {
            
            self.performHalf()
            
        }
        
    }
    
}

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

//let decayCounter = DecayCounter(72000, 40, 0)
//let decayCounter2 = DecayCounter(72000, 40, 1)
//let decayCounter3 = DecayCounter(7200, 40, 2)

var doseArray = [DecayCounter]()

for i in 1..<121 {
    
    doseArray.append(DecayCounter(72000, 40, i))
    
}

let doses = Doses(arr: doseArray)

doses.getDoseAtCurrentTime()

//decayCounter.get()
////decayCounter.update()
//decayCounter.get()


