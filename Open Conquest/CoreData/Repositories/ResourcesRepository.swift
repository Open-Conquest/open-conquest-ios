//
//  ResourcesRepository.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class ResourcesRepository {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveResources(player: CDPlayer, resources: Resources) {
        let resourcesEntity = NSEntityDescription.entity(forEntityName: "CDResources", in: context)
        let cdResources = CDResources(entity: resourcesEntity!, insertInto: context)
        cdResources.setValue(resources.gold, forKey: "gold")
        player.resources = cdResources
        do {
            try context.save()
        } catch {
            print("FUCKKKKKK")
        }
    }
}
