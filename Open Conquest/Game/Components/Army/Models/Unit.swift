//
//  Unit.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/9/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

/**
    This enum should correspond to the values in the `unit`.`unit_id` table of the world database.
 */
enum UnitIds: Int {
    case wizard = 0
    case bear = 1
}

enum UnitNames: String {
    case wizard = "Wizard"
    case bear = "Bear"
}

enum UnitType {
    case wizard
    case bear
}

struct Unit: Hashable {
    let id: Int
    let attack: Int
    let defense: Int
    let level: Int
    let name: String
    
    init(id: Int, attack: Int, defense: Int, level: Int, name: String) {
        self.id = id
        self.attack = attack
        self.defense = defense
        self.level = level
        self.name = name
    }
    
    static func == (lhs: Unit, rhs: Unit) -> Bool {
        return (lhs.id == rhs.id)
    }
}
