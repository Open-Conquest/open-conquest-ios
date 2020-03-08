//
//  ArmyDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArmyDTO {
    var units = [ArmyUnitsDTO]()
    
    init(json: JSON) {
        for jsonArmyUnits in json["units"].array! {
            units.append(ArmyUnitsDTO(json: jsonArmyUnits))
        }
    }
}
