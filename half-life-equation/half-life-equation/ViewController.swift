//
//  ViewController.swift
//  half-life-equation
//
//  Created by Mark Hamilton on 6/19/16.
//  Copyright © 2016 dryverless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var doseArray = [DecayCounter]()
        
        for i in 1..<121 {
            
            doseArray.append(DecayCounter(72000.0, 40.0, i)!)
            
        }
        
        let doses = Doses(arr: doseArray)
        
        print(doses.getDoseAtCurrentTime())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

