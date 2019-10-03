//
//  LoadComponent.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetComponentRequest: Request {
    
    init(component: GameComponents) {
        let data = JSON()
        super.init(service: component.rawValue, operation: "get", data: data)
    }
}

