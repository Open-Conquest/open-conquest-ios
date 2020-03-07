//
//  Player.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class Player: Entity {
    let name: String

    init(id: EntityID, name: String) {
        self.name = name
        super.init(id: id)
    }
}
