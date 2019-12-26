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
    let start_time: Date
    let end_time: Date
    let total_time: TimeInterval
    let speed_modifier: Float
    
    required init(json: JSON) {
        user_id = 0
        start_tile = json["start_tile_id"].int!
        end_tile = json["end_tile_id"].int!
        army_id = json["army_id"].int!
        speed_modifier = json["speed_modifier"].float!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        start_time = formatter.date(from: json["start_time"].string!)!
        end_time = formatter.date(from: json["end_time"].string!)!
        total_time = end_time.timeIntervalSince(start_time)
    }
    
    func toJSON() -> JSON {
        fatalError("not implemented")
        return JSON()
    }
    
}
