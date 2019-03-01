//
//  Demo.swift
//  Optional
//
//  Created by LeeHow on 2019/3/1.
//  Copyright © 2019 LeeHow. All rights reserved.
//

import Foundation


struct Order {
    let orderNumber: Int
    let person: Person?
    
}

struct Person {
    let name: String
    let address: Address?
    
}

struct Address {
    let streetName: String
    let city: String
    let state: String?
    
}






