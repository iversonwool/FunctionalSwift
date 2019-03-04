//
//  Util.swift
//  EnumDemo
//
//  Created by LeeHow on 2019/3/4.
//  Copyright © 2019 LeeHow. All rights reserved.
//

import Foundation



enum LookupError: Error {
    case CapitalNotFound
    case PopulationNotFound
}

enum PopulationResult {
    case Success(Int)
    case Error(LookupError)
}


let capitals = ["paris": "Paris"]

let cities = ["Paris": 1_000]



func populationOfCapital(country: String) -> PopulationResult {
    guard let capital = capitals[country] else { return .Error(.CapitalNotFound) }
    guard let population = cities[capital] else { return .Error(.PopulationNotFound) }
    return .Success(population)
}
