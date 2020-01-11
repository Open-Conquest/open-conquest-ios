//
//  CDCity+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/11/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCity> {
        return NSFetchRequest<CDCity>(entityName: "CDCity")
    }

    @NSManaged public var city_id: Int64
    @NSManaged public var city_level: Int64
    @NSManaged public var city_name: String?
    @NSManaged public var tile_id: Int64
    @NSManaged public var user_id: Int64
    @NSManaged public var tile: CDTile?
    @NSManaged public var user: CDUser?

}
