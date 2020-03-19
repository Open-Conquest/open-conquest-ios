//
//  Army.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/15/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

/**
    This enum should correspond to the values in the `unit`.`unit_id` table of the world database.
 */
enum UnitTypes: Int {
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

struct Unit {
    let type: Int
    let name: String
    let attack: Int
    let defense: Int
    let goldCost: Int
    
    init(type: Int, name: String, attack: Int, defense: Int, goldCost: Int) {
        self.type = type
        self.name = name
        self.attack = attack
        self.defense = defense
        self.goldCost = goldCost
    }
}

class ArmyUnits {
    var count: Int
    var unit: Unit
    
    init(count: Int, unit: Unit) {
        self.count = count
        self.unit = unit
    }
}

class Army: Entity {
    var units = [ArmyUnits]()
    
    init(id: Int, units: [ArmyUnits]) {
        self.units = units
        super.init(id: EntityID(value: id))
    }
    
    func getUnits() -> [ArmyUnits] {
        return units
    }
}

// OLD ARMY CLASS
//class Army: GameEntity {
//    var units = [Unit: Int]()
//
//    init(units: [Unit: Int])  {
//        self.units = units
//    }
//
//    required init(json: JSON) {
//    }
//
//    func toJSON() -> JSON {
//        return JSON()
//    }
//
//    func addUnit(unit: Unit, number: Int) {
//        if (units[unit] == nil) {
//            units[unit] = number
//        } else {
//            units[unit] = units[unit]! + number
//        }
//    }
//
//    func numUnits() -> Int {
//        return units.count
//    }
//
//    func numUnits(unit: Unit) -> Int {
//        if (units[unit] == nil) {
//            return 0
//        }
//        return units[unit]!
//    }
//
//    func getUnits() -> [[Unit: Int]] {
//        var unitsArr = [[Unit: Int]]()
//        for (unit, count) in units {
//            var unitDict = [Unit: Int]()
//            unitDict[unit] = count
//            unitsArr.append(unitDict)
//        }
//        return unitsArr
//    }
//
//}
