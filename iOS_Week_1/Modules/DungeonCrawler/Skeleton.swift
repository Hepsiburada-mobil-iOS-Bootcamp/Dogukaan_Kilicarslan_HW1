//
//  Skeleton.swift
//  iOS_Week_1
//
//  Created by DarkBringer on 22.09.2021.
//

import Foundation

//A lowly standart default enemy to grind some experience. They might be useful after they die??? --->

class Skeleton: EnemyClass, EnemyProtocol {
    
    func takeDamage(amount: Int) {
        health -= amount
        if health == 0 {
            print("Skeleton becomes a vitamin D powder.")
        } else {
            print("Skeleton takes \(amount) damage and has \(health) hp left")
        }
    }
    func move() {
        print("Skeleton walk forwards.")
    }
    func attack() {
        print("Skeleton lands a hit, does \(attackStrength) damage")
    }
    
    
}

