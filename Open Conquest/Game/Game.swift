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
    var context: NSManagedObjectContext
    var armyService: ArmyService
    var cityService: CityService
    var mapService: MapService
    var marchService: MarchService
    var userService: UserService
    var playerService: PlayerService

    init(context: NSManagedObjectContext) {
        self.context = context
        // create repositories with context
        let playerRepository = PlayerRepository(context: context)
        let cityRepository = CityRepository(context: context)
        let armyRepository = ArmyRepository(context: context)
        let resourcesRepository = ResourcesRepository(context: context)
        
        // create enitity services with repositories
        armyService = ArmyService(context: context)
        cityService = CityService()
        mapService = MapService()
        marchService = MarchService()
        userService = UserService()
        playerService = PlayerService(
            playerRepository: playerRepository,
            cityRepository: cityRepository,
            armyRepository: armyRepository,
            resourcesRepository: resourcesRepository
        )
        
        print("Game intialized")
    }
}

enum GameEntityType: String {
    case army   = "army"
    case city   = "city"
    case map    = "map"
    case march  = "march"
    case user   = "user"
    case player = "player"
}
