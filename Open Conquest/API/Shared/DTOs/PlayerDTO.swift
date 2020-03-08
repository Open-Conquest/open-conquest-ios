//
//  PlayerDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class PlayerDTO {
    var name: String
    
    /* Create a PlayerDTO from a name String */
    init(name: String) {
        self.name = name
    }
    
    /* Create a PlayerDTO from a Player Entity */
    init(player: Player) {
        self.name = player.getName()
    }
    
    func toJSON() -> JSON {
        return JSON([
            "name": name
        ])
    }
}
