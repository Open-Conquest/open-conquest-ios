//
//  CityRepository.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class CityRepository {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveCity(player: CDPlayer, city: City) {
        /* add city to player if it exists in player entity */
        let cityEntity = NSEntityDescription.entity(forEntityName: "CDCity", in: context)
        let cdCity = CDCity(entity: cityEntity!, insertInto: context)
        cdCity.setValue(city.name, forKey: "name")
        cdCity.setValue(city.level, forKey: "level")
        cdCity.setValue(city.row, forKey: "row")
        cdCity.setValue(city.col, forKey: "col")
        player.city = cdCity
        do {
            try context.save()
        } catch {
            print("FUCKKKKKK")
        }
    }
}
