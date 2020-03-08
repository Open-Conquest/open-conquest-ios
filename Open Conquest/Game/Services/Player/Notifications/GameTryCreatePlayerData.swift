//
//  GameCreatePlayerData.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class GameTryCreatePlayerData {
    let player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    func getPlayer() -> Player {
        return self.player
    }
}
