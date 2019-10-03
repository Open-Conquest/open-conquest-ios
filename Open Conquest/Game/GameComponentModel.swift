//
//  GameComponentModel.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/23/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol GameComponentModel {
    init(json: JSON)
    func toJSON() -> JSON
}
