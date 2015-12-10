//
//  Player.swift
//  RPG-OOP
//
//  Created by Brian Kress on 12/9/15.
//  Copyright © 2015 Brian Kress. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory (item: String) {
        _inventory.append(item)
    }

    convenience init(name: String, hp: Int, attackPwr: Int) {
        
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }


}