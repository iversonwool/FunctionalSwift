//
//  highOrderFunc.swift
//  HighOrderFunction
//
//  Created by 李浩 on 2019/2/25.
//  Copyright © 2019 李浩. All rights reserved.
//

import Foundation

//open
//public
//file private
//private
public func incrementArray(array: [Int]) -> [Int] {
    var result: [Int] = []
    for elemet in array {
        result.append(elemet + 1)
    }
    return result
}

public func doubleArray(array: [Int]) -> [Int] {
    var result: [Int] = []
    for elemet in array {
        result.append(elemet * 2)
    }
    return result
}

func computeIntArray(array: [Int], transform: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    for elemet in array {
        result.append(transform(elemet))
    }
    return result
}

public func doubleArray2(array: [Int]) -> [Int] {
    
    return computeIntArray(array: array, transform: { (element) -> Int in
        element * 2
    })
}
