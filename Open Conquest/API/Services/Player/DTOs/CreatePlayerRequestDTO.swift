//
//  CreatePlayerRequestDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class CreatePlayerRequestDTO {
    var player: PlayerDTO
    
    init(player: PlayerDTO) {
        self.player = player
    }
    
    // init from game entities
}
