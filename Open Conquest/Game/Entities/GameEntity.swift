//
//  GameEntity.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/20/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol GameEntity {
    init(json: JSON)
    func toJSON() -> JSON
}
