//
//  City.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class City: GameComponentModel {
    
    var tile_id:    Int
    var name:       String
    var city_id:    Int
    var user_id:    Int
    var level:      Int
    
    required init(json: JSON) {
        // parse json that would be expected in
        tile_id = json["tile_id"].int!
        name = json["city_name"].string!
        city_id = json["city_id"].int!
        user_id = json["user_id"].int!
        level = json["city_level"].int!
    }
    
    func toJSON() -> JSON {
        return JSON()
    }
    
}
