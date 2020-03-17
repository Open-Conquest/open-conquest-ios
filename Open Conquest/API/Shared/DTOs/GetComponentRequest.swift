//
//  GetEntityRequest.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetEntityRequest: Request {
    
    init(entity: GameEntityType) {
        let data = JSON()
        super.init(service: APIServices(rawValue: entity.rawValue)!, operation: APIOperations.CreatePlayer, data: data)
    }
}

