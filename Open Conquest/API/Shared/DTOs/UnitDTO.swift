//
//  UnitDTO.swift
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
}
