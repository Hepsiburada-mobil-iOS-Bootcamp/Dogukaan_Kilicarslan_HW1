//
//  Dragon.swift
//  iOS_Week_1
//
//  Created by DarkBringer on 22.09.2021.
//
//commitCheck

import Foundation

//A powerful enemy that can spit fire and burn everyone and everything in its path!!!111!!1  --->

class Dragon: EnemyClass, EnemyProtocol {
    var wingSpan = 2
    func move() {
        print("Dragon fly forwards")
    }
    
    func howBig() {
        print("The dragon's wingspan is almost \(wingSpan) meters!")
    }
    
    func talk(speech: String) {
        print("Dragon says: \(speech)")
    }
    
    func attack() {
        print("Dragon spits fire, and it does \(self.attackStrength) damage")
    }
    func takeDamage(amount: Int) {
        health -= amount
        print("Dragon takes \(amount) damage and has \(health) hp left")
    }
}
