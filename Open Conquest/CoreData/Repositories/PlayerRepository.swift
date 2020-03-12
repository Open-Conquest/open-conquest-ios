//
//  PlayerRepository.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class PlayerRepository {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func savePlayer(player: Player) -> CDPlayer {
        /* create new core data player from entity */
        let playerEntity = NSEntityDescription.entity(forEntityName: "CDPlayer", in: context)
        let cdPlayer = CDPlayer(entity: playerEntity!, insertInto: context)
        cdPlayer.setValue(player.getName(), forKey: "name")
        
        /* add resources to player */
        let resources = player.getResources()
        let resourcesEntity = NSEntityDescription.entity(forEntityName: "CDResources", in: context)
        let cdResources = CDResources(entity: resourcesEntity!, insertInto: context)
        cdResources.setValue(resources.gold, forKey: "gold")
        
        /* add city to player if it exists in player entity */
        if let city = player.getCity() {
            let cityEntity = NSEntityDescription.entity(forEntityName: "CDCity", in: context)
            let cdCity = CDCity(entity: cityEntity!, insertInto: context)
            cdCity.setValue(city.name, forKey: "name")
            cdCity.setValue(city.level, forKey: "level")
            cdCity.setValue(city.row, forKey: "row")
            cdCity.setValue(city.col, forKey: "col")
            cdPlayer.city = cdCity
        }
        
        /* add armiems to player if there are armies */
        let armies = player.getArmies()
        let armyEntity = NSEntityDescription.entity(forEntityName: "CDArmy", in: context)
        let armyUnitsEntity = NSEntityDescription.entity(forEntityName: "CDArmyUnits", in: context)
        for army in armies {
            let cdArmy = CDArmy(entity: armyEntity!, insertInto: context)
            for armyUnits in army.getUnits() {
                let cdArmyUnits = CDArmyUnits(entity: armyEntity!, insertInto: context)
            }
        }
        
        do {
            try context.save()
        } catch {
            print("FUCKKKKKK")
        }
        
        return cdPlayer
    }
    
    func getPlayer(player: Player) -> Player? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CDPlayer")
        request.predicate = NSPredicate(format: "name = %@", player.getName())
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            if (result.count > 1) {
                fatalError("NOOOO")
            } else {
                for data in result as! [NSManagedObject] {
                    return Player(
                        id: nil, name:
                        data.value(forKey: "name") as! String
                    )
                }
            }
        } catch {
            print("Failed")
        }
        return nil
    }
}
