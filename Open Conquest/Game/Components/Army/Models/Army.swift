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
    
    func toJSON() -> JSON {
        return JSON()
    }
    
    func addUnit(unit: Unit, number: Int) {
        if (units[unit] == nil) {
            units[unit] = number
        } else {
            units[unit] = units[unit]! + number
        }
    }
    
    func numUnits() -> Int {
        return units.count
    }
    
    func numUnits(unit: Unit) -> Int {
        if (units[unit] == nil) {
            return 0
        }
        return units[unit]!
    }
    
    func getUnits() -> [[Unit: Int]] {
        var unitsArr = [[Unit: Int]]()
        for (unit, count) in units {
            var unitDict = [Unit: Int]()
            unitDict[unit] = count
            unitsArr.append(unitDict)
        }
        return unitsArr
    }
    
}
