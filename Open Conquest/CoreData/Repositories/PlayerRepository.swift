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
    
    func savePlayer(player: Player) {
        let playerEntity = NSEntityDescription.entity(forEntityName: "CDPlayer", in: context)
        let cdPlayer = CDPlayer(entity: playerEntity!, insertInto: context)
        cdPlayer.setValue(player.getName(), forKey: "name")
        
        let resourcesEntity = NSEntityDescription.entity(forEntityName: "CDResources", in: context)
        let cdResources = CDResources(entity: resourcesEntity!, insertInto: context)
        cdPlayer.resources = cdResources
        
        do {
            try context.save()
        } catch {
            print("FUCKKKKKK")
        }
    }
    
    func getPlayer(player: Player) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CDPlayer")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
               print(data.value(forKey: "name") as! String)
            }
        } catch {
            print("Failed")
        }
    }
}
