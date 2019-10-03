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
    
    var start_tile: Int
    var end_tile: Int
    var user_id: Int
    var army_id: Int
    
    required init(json: JSON) {
        start_tile = 0
        end_tile = 0
        user_id = 0
        army_id = 0
    }
    
    func toJSON() -> JSON {
        fatalError("not implemented")
        return JSON()
    }
    
}
