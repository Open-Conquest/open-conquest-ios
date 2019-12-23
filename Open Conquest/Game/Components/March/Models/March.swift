//
//  March.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class March: GameComponentModel {
    
    let start_tile: Int
    let end_tile: Int
    let user_id: Int
    let army_id: Int
    let end_time: Date
    
    let startTileRow: Int = 0
    let startTileCol: Int = 0
    let endTileRow: Int = 5
    let endTileCol: Int = 5
    
    required init(json: JSON) {
        user_id = 0
        start_tile = json["start_tile_id"].int!
        end_tile = json["end_tile_id"].int!
        army_id = json["army_id"].int!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        end_time = formatter.date(from: json["end_time"].string!)!
    }
    
    func toJSON() -> JSON {
        fatalError("not implemented")
        return JSON()
    }
    
}
