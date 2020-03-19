//
//  GetWorldRequestDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetWorldRequestDTO: Request {
    var worldID: Int
    
    init(token: Token) {
        worldID = 1
        let data = JSON([
            "worldID": worldID
        ])
        super.init(service: .World, operation: .GetWorld, token: token, data: data)
    }
}
