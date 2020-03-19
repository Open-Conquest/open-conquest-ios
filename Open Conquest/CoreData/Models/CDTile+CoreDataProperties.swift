//
//  CDTile+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDTile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTile> {
        return NSFetchRequest<CDTile>(entityName: "CDTile")
    }

    @NSManaged public var row: Int16
    @NSManaged public var col: Int16
    @NSManaged public var type: Int16

}
