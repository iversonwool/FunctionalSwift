//
//  ViewController.swift
//  Optional
//
//  Created by LeeHow on 2019/2/28.
//  Copyright © 2019 LeeHow. All rights reserved.
//

import UIKit

let cities = ["Paris": 2241,
              "Madrid": 3165,
              "Amsterdam": 827,
              "Berlin": 2562]



let capitals = ["France": "Paris",
                "Spain" : "Madrid",
                "The Netherlands": "Amsterdam",
                "Belgium": "Brussels"]



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let madridPopulation = cities["Madrid"]
        
        
        switch madridPopulation {
        case 0?:
            print("Nobody in Madrid")
        case (1..<1000)?:
            print("Less than a million in Madrid")
        case .some(let x):
            print("\(x) people in Madrid")
        case .none:
            print("we don't known about Madrid")
        }
        
        
       
        
        print(populationDescriptionForCity(city: "Madrid") ?? "Unknown")
        
        
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
        
        
        
        
        
        
        
        //可选值链式调用
        let order = Order(orderNumber: 3, person: Person(name: "Jhon", address: Address(streetName: "Nan", city: "Hello", state: "XXX")))
        if let myState = order.person?.address?.state {
            print("this order will be shipped to \(myState)")
        } else {
            print("Unknown person, address or state")
        }

        
        
        let a: Int? = 3
        print(incrementOptional(optional: a) ?? NSNotFound)
        
        
        
        
        let number = Int("42")
        
        let mapSquare = number.map { (x) -> Int in
            return x % 2 != 0 ? 0 : x
        }
        print(mapSquare ?? 0)
        
        let flatMapSquare = number.flatMap { (x) -> Int? in
            return x % 2 != 0 ? nil : x
        }
        print(flatMapSquare ?? 0)
        
        /////////////////////////////////////////////////////////////////////////////////////////////

        
    }
    
    func populationDescriptionForCity(city: String) -> String? {
        guard let population = cities[city] else { return nil }
        return "The population of Madrid is \(population * 1_000)"
    }
    
    func incrementOptional(optional: Int?) -> Int? {
        return optional.map({ $0 + 1 })
        
        //mark: - “为什么将这个函数命名为 map？它和运用于数组的 map 运算有什么共同点吗？我们有充分的理由将这两个函数都称为 map，但是现在我们暂时不会展开，之后在关于函子、适用函子与单子的章节中会再次讨论这个问题。”
        
    }
    
    
    func populationOfCapital(country: String) -> Int? {
        guard let capital = capitals[country], let population = cities[capital] else { return nil }
        return population * 1_000
    }

    func populationOfCapital2(country: String) -> Int? {
        return capitals[country].flatMap({ capital in
            cities[capital].flatMap({ population in
                return population * 1_000
            })
        })
    }
    
    func populationOfCapital3(country: String) -> Int? {
        return capitals[country].flatMap({ capital in
            return cities[capital]
        }).flatMap({ population in
            return population * 1_000
        })
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
