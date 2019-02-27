//
//  Curry.swift
//  HighOrderFunction
//
//  Created by LeeHow on 2019/2/27.
//  Copyright © 2019 李浩. All rights reserved.
//

import Foundation

func curry<A, B, C>(f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { x in
        { y in
            f(x, y)
        }
    }
}
