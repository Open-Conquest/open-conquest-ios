//
//  ArmyDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class UnitDTO {
    let type: Int
    let name: String
    let attack: Int
    let defense: Int
    let goldCost: Int
    
    init(json: JSON) {
        type = json["type"].int!
        name = json["name"].string!
        attack = json["attack"].int!
        defense = json["defense"].int!
        goldCost = json["goldCost"].int!
    }
    
    func toJSON() -> JSON {
        return JSON([
            "type": type,
            "name": name,
            "attack": attack,
            "defense": defense,
            "goldCost": goldCost
        ])
    }
    
    func toEntity() -> Unit {
        return Unit(type: type, name: name, attack: attack, defense: defense, goldCost: goldCost)
    }
}

class ArmyUnitsDTO {
    let count: Int
    let unit: UnitDTO
    
    init(json: JSON) {
        self.count = json["count"].int!
        self.unit = UnitDTO(json: json["unit"])
    }
    
    func toJSON() -> JSON {
        return JSON([
            "count": count,
            "unit": unit.toJSON()
        ])
    }
    
    func toEntity() -> ArmyUnits {
        return ArmyUnits(count: count, unit: unit.toEntity())
    }
}

class ArmyDTO {
    var units = [ArmyUnitsDTO]()
    
    /* Initialize an army dto from some json exepecting army schema */
    init(json: JSON) {
        for jsonArmyUnits in json["units"].array! {
            units.append(ArmyUnitsDTO(json: jsonArmyUnits))
        }
    }
    
    /* Create an army entity from this dto */
    func toEntity() -> Army {
        var armyUnitsEntities = [ArmyUnits]()
        for armyUnits in units {
            armyUnitsEntities.append(armyUnits.toEntity())
        }
        
        return Army(id: 0, units: armyUnitsEntities)
    }
}
