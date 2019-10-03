//
//  Army.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/15/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class Army: GameComponentModel {
    
    required init(json: JSON) {
        // do nothing for now i guess
    }
    
    func toJSON() -> JSON {
        return JSON()
    }
}
