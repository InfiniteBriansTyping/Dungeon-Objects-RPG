//
//  Devil-Wizard.swift
//  RPG-OOP
//
//  Created by Brian Kress on 12/9/15.
//  Copyright © 2015 Brian Kress. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}