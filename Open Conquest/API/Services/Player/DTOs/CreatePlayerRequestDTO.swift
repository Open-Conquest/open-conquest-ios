//
//  CreatePlayerRequestDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class CreatePlayerRequestDTO: Request {
    var player: PlayerDTO
    
    init(token: Token, player: PlayerDTO) {
        self.player = player
        let data = JSON([
            "player": player.toJSON()
        ])
        super.init(service: .Player, operation: .CreatePlayer, token: token, data: data)
    }
    
    // init from game entities
}
