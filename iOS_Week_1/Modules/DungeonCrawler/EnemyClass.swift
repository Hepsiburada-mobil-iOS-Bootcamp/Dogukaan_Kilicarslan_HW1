//
//  EnemyClass.swift
//  iOS_Week_1
//
//  Created by DarkBringer on 22.09.2021.
//

import Foundation

// Every enemy type has these stats --->

class EnemyClass {
    var health: Int
    var attackStrength: Int
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
}
