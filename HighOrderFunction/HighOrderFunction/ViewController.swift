//
//  ViewController.swift
//  HighOrderFunction
//
//  Created by 李浩 on 2019/2/25.
//  Copyright © 2019 李浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let originalArray = [1, 2, 3, 4, 5]
        let result = incrementArray(array: originalArray)
        print(result)
        
        print(doubleArray2(array: originalArray))
        
        //单表达式闭包 隐式返回
        print(originalArray.map({ (element) -> Int in
            element * element
        }))
    }


}

