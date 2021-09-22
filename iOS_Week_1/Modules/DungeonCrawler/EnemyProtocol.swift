//
//  EnemyProtocol.swift
//  iOS_Week_1
//
//  Created by DarkBringer on 22.09.2021.
//

import Foundation

// Enemies need to have these methods inside to make them interactable. --->

protocol EnemyProtocol {
    
    func takeDamage(amount: Int)
    func move()
    func attack()
    
}
