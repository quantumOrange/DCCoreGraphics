//
//  ViewController.swift
//  DCCoreGraphics
//
//  Created by quantumOrange on 02/26/2019.
//  Copyright (c) 2019 quantumOrange. All rights reserved.
//
import DCCoreGraphics
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        let p = CGPoint(angle: 0.1, radius: 3.0)
        let q = CGPoint(x: 1.0, y: 1.0)
        let s = p + q
       
        // Dispose of any resources that can be recreated.
    }

}

