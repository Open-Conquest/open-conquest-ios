//
//  ArmyUnitsDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

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
}
