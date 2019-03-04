//
//  ViewController.swift
//  EnumDemo
//
//  Created by LeeHow on 2019/3/4.
//  Copyright © 2019 LeeHow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let _: PopulationResult = .Success(1_000)
        
        switch populationOfCapital(country: "paris") {
        case let .Success(population):
            print("Paris's capital has \(population) thousand inhabitants")
        case let .Error(error):
            print("Error: \(error)")
//        default:
//            <#code#>
        }
        
    }


}

