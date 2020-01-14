//
//  Army.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/15/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

class Army: GameComponentModel {
    var units = [Unit: Int]()
    
    init(units: [Unit: Int])  {
        self.units = units
    }
    
    required init(json: JSON) {
    }
    
    func addUnits(units: [Unit: Int]) {
        
    }
    
    func addUnit(unit: Unit, number: Int) {
        
    }
    
    func toJSON() -> JSON {
        return JSON()
    }
}
