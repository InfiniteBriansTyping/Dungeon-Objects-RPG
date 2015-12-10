//
//  Kimara.swift
//  RPG-OOP
//
//  Created by Brian Kress on 12/9/15.
//  Copyright © 2015 Brian Kress. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough hide", "Kimara Venom", "Gold-plated Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
    
    
}