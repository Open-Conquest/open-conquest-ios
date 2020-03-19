//
//  WorldRepository.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class WorldRepository {
    var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}
