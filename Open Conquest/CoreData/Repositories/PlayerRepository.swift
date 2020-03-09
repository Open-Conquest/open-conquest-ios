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
        let entity = NSEntityDescription.entity(forEntityName: "CDPlayer", in: context)
        let cdPlayer = NSManagedObject(entity: entity!, insertInto: context)
        cdPlayer.setValue(player.getName(), forKey: "name")
    }
}
