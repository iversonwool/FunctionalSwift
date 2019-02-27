//
//  City.swift
//  HighOrderFunction
//
//  Created by LeeHow on 2019/2/27.
//  Copyright © 2019 李浩. All rights reserved.
//

import Foundation

public struct City {
    let name: String
    let population: Int
}


extension City {
    func cityByScalingPopulation() -> City {
        return City(name: name, population: population * 1_000)
    }
}


func cities() -> [City] {
    let paris = City(name: "Paris", population: 2241)
    let madrid = City(name: "Madrid", population: 3165)
    let amsterdam = City(name: "Amsterdam", population: 827)
    let berlin = City(name: "Berlin", population: 3562)
    return [paris, madrid, amsterdam, berlin]
}
