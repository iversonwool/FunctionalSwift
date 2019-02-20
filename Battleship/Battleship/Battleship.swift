//
//  Battleship.swift
//  Battleship
//
//  Created by LeeHow on 2019/2/20.
//  Copyright © 2019 LeeHow. All rights reserved.
//

import Foundation


//Figure 1.位于原点的船舶射程范围内的点
typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
    
}

extension Position {
    func inRange(range: Distance) -> Bool {
        return sqrt(x * x + y * y) <= range
    }
}

extension Position {
    func minus(p: Position) -> Position {
        return Position(x: p.x - x, y: p.y - y)
    }
    
    var length: Double {
        return sqrt(x * x + y * y)
    }
    
}

//Figure 2.允许传有它自己的位置 （过渡版本）
struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
    
}

/*
extension Ship {
    
    /// 能与目标船舶交战
    ///
    /// - Parameter target: <#target description#>
    /// - Returns: <#return value description#>
    func canEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange
    }
}
 */

/*
//Figure 3.避免与过近的地方船舶交战

extension Ship {
    
    /// 能与目标船舶交战 & 又在地方船舶的射程范围外
    ///
    /// - Parameter target: 目标船舶
    /// - Returns: 是否能安全交战
    func canSafelyEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance > unsafeRange && targetDistance <= firingRange
    }
}
 */

/*
//Figure 4. 避免敌方过于接近友方船舶

extension Ship {
    
    /// 能与目标船舶交战 & 又在地方船舶的射程范围外 & 友方船舶也在地方船舶的射程范围内
    ///
    /// - Parameter target: 目标船舶
    /// - Returns: 是否能安全交战
    func canSafelyEngageShip(target: Ship, friendly: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        
        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        let friendlyDistance = sqrt(friendlyDx * friendlyDx + friendlyDy * friendlyDy)
        
        
        return targetDistance > unsafeRange && targetDistance <= firingRange && friendlyDistance > unsafeRange
    }
}
 */


//“随着代码的发展，它变得越来越难维护。
//这个函数包含了一大段复杂的计算的代码。
//我们可以在 Position 中添加两个负责几何运算的辅助函数让这段代码变得清晰易懂一些：”
//
//Excerpt From: Chris Eidhof. “函数式 Swift.” Apple Books. 

//使用辅助函数

extension Ship {
    /// 能与目标船舶交战 & 又在地方船舶的射程范围外 & 友方船舶也在地方船舶的射程范围内
    ///
    /// - Parameter target: 目标船舶
    /// - Returns: 是否能安全交战
    func canSafelyEngageShip(target: Ship, friendly: Ship) -> Bool {

        let targetDistance = target.position.minus(p: position).length
        
        let friendlyDistance = friendly.position.minus(p: target.position).length
        
        
        return targetDistance > unsafeRange
            && targetDistance <= firingRange
            && friendlyDistance > unsafeRange
    }
    
}

