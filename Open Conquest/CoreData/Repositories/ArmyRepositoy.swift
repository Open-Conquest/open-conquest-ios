//
//  ArmyRepositoy.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class ArmyRepository {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveArmy(player: CDPlayer, army: Army) {
        /* add army to player if it exists in player entity */
        let armyEntity = NSEntityDescription.entity(forEntityName: "CDArmy", in: context)
        let cdArmy = CDArmy(entity: armyEntity!, insertInto: context)
        cdArmy.player = player
        
        /* add each army units to cd with a new unit cd entry as well */
        for armyUnit in army.getUnits() {
            let armyUnitsEntity = NSEntityDescription.entity(forEntityName: "CDArmyUnits", in: context)
            let cdArmyUnits = CDArmyUnits(entity: armyUnitsEntity!, insertInto: context)
            
            let unitEntity = NSEntityDescription.entity(forEntityName: "CDUnit", in: context)
            let cdUnit = CDUnit(entity: unitEntity!, insertInto: context)
            let unit = armyUnit.unit
            cdUnit.setValue(unit.type, forKey: "type")
            cdUnit.setValue(unit.name, forKey: "name")
            cdUnit.setValue(unit.attack, forKey: "attack")
            cdUnit.setValue(unit.defense, forKey: "defense")
            cdUnit.setValue(unit.goldCost, forKey: "goldCost")
            
            cdArmyUnits.unit = cdUnit
            cdArmyUnits.army = cdArmy
        }
        
        do {
            try context.save()
        } catch {
            print("FUCKKKKKK")
        }
    }
}
