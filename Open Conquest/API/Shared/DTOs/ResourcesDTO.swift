//
//  ResourcesDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class ResourcesDTO {
    let gold: Int
    
    /* Initialze DTO from json adhering to Resources schema */
    init(json: JSON) {
        self.gold = json["gold"].int!
    }
    
    /* Create json specified by Resources schema */
    func toJSON() -> JSON {
        return JSON([
            "gold": gold
        ])
    }
}
