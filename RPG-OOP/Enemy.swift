//
//  Enemy.swift
//  RPG-OOP
//
//  Created by Brian Kress on 12/9/15.
//  Copyright © 2015 Brian Kress. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Rusty Dagger", "Cracked Buckler", "Crusty Eye Goo", "Problematic Venerial Disease", "72 Virgins"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
    
    
}