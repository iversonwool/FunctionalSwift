//
//  ViewController.swift
//  Immutable
//
//  Created by LeeHow on 2019/3/4.
//  Copyright © 2019 LeeHow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        var array1 = [1, 3, 5, 7, 9]
        
        var array2 = array1
        
        array2[1] = 0
        print(array1)
        
        
        
        /////////////////////////////////////////////////////
        
        
        let immutablePoint = PointStruct(x: 3, y: 6)
//        immutablePoint = PointStruct(x: 4, y: 7) //denied
        var mutablePoint = PointStruct(x: 8, y: 8)
        mutablePoint.x = 0
        
        
        
        var immutablePoint2 = ImmutablePointStruct(x: 6, y: 0)
        
//        immutablePoint2.x = 4//denied
    }
    
    
}

