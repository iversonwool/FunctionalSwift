//
//  Currying.swift
//  WrappingCoreImage
//
//  Created by LeeHow on 2019/2/25.
//  Copyright © 2019 李浩. All rights reserved.
//

import Foundation

func add1(a: Int, b: Int) -> Int {
    return a + b
}

func add2(a: Int) -> (Int) -> Int {
    return { b in
        return a + b
    }
}

