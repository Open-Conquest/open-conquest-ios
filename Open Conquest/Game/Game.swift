//
//  Game.swift
//  Open Conquest
//
//  Created by zach on 6/27/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class Game {
    var subscriber:     Subscriber
    var gamePublisher:  GamePublisher
    var context:        NSManagedObjectContext
    
    var armyService:    ArmyService
    var cityService:    CityService
    var mapService:     MapService
    var marchService:   MarchService
    var userService:    UserService

    init(dataContext: NSManagedObjectContext) {
        context         = dataContext
        subscriber      = Subscriber()
        gamePublisher   = GamePublisher()
        
        armyService     = ArmyService(context: context)
        cityService     = CityService()
        mapService      = MapService()
        marchService    = MarchService()
        userService     = UserService()
        
        print("Game intialized")
    }
}

enum GameEntityType: String {
    case army   = "army"
    case city   = "city"
    case map    = "map"
    case march  = "march"
    case user   = "user"
}
