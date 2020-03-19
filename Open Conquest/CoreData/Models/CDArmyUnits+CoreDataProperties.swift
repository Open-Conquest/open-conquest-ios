//
//  CDArmyUnits+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDArmyUnits {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArmyUnits> {
        return NSFetchRequest<CDArmyUnits>(entityName: "CDArmyUnits")
    }

    @NSManaged public var count: Int64
    @NSManaged public var army: CDArmy?
    @NSManaged public var unit: CDUnit?

}
