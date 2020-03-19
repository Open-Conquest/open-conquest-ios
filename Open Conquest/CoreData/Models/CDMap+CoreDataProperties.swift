//
//  CDMap+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDMap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMap> {
        return NSFetchRequest<CDMap>(entityName: "CDMap")
    }

    @NSManaged public var map_id: Int16
    @NSManaged public var maxRows: Int16
    @NSManaged public var maxCols: Int16
    @NSManaged public var name: String?

}
