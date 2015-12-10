//
//  ViewController.swift
//  RPG-OOP
//
//  Created by Brian Kress on 12/9/15.
//  Copyright © 2015 Brian Kress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMsg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "WoahMan", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
    
    }

    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(3))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else if rand == 2 {
            enemy = DevilWizard(startingHp: 60, attackPwr: 16)
        } else {
            enemy = Enemy(startingHp: 100, attackPwr: 10)
        }
        
        enemyImg.hidden = false
        printLbl.text = "\(enemy.type) has appeared!"
        enemyHpLbl.text = "\(enemy.hp) HP"
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMsg
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
   
    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMsg = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "\(player.name) killed \(enemy.type)"
            enemyImg.hidden = true
        }
        
    }
    

}

