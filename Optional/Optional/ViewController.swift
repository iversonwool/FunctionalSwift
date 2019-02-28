//
//  ViewController.swift
//  Optional
//
//  Created by LeeHow on 2019/2/28.
//  Copyright © 2019 LeeHow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cities = ["Paris": 2241,
                      "Madrid": 3165,
                      "Amsterdam": 827,
                      "Berlin": 2562]
        
        let madridPopulation = cities["Madrid"]
        
//        guard let v = madridPopulation else {
//            print("no value")
//            return
//        }
//        print(v)
        
        //forced unwrapping
        //强制解包
//        print(madridPopulation!)
        
        
        //optional binding
        //可选绑定
//        if let madridPopulation = cities["Madrid"] {
//            print("the population of Madrid is \(madridPopulation * 1_000)")
//        } else {
//            print("Unknown city: Madrid")
//        }
        
//        单表达式闭包隐式返回
        
        //autoclosure 之后 不用显示的写闭包
        print(madridPopulation ??? 3311)

    }


}

//中缀运算符
//infix operator ???
//func ???<T>(optional: T?, defaultValue: T) -> T {
//    if let x = optional {
//        return x
//    } else {
//        return defaultValue
//    }
//}

// 避免计算defaultValue

//infix operator ???
//func ???<T>(optional: T?, defaultValue: () -> T) -> T {
//    if let x = optional {
//        return x
//    } else {
//        return defaultValue()
//    }
//}


//autoclosure


infix operator ???: NilCoalescingPrecedence
func ???<T>(optional: T?, defaultValue: @autoclosure () -> T) -> T {
    if let x = optional {
        return x
    } else {
        return defaultValue()
    }
}
