//
//  CityDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityDTO {
    let name: String
    let level: Int
    let row: Int
    let col: Int
    
    init(json: JSON) {
        name = json["name"].string!
        level = json["level"].int!
        row = json["row"].int!
        col = json["col"].int!
    }
    
    func toJSON() -> JSON {
        return JSON([
            "name": name,
            "level": level,
            "row": row,
            "col": col
        ])
    }
}
