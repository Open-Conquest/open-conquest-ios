//
//  Entity.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

struct EntityID {
    let value: Int
}

class Entity {
    let id: EntityID?
    
    init(id: EntityID?) {
        self.id = id
    }
}
