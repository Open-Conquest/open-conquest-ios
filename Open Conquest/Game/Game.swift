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
    var playerService: PlayerService
    var userService: UserService
    var worldService: WorldService

    init(context: NSManagedObjectContext) {
        self.context = context
        // create repositories with context
        let armyRepository = ArmyRepository(context: context)
        let cityRepository = CityRepository(context: context)
        let mapRepository = MapRepository(context: context)
        let playerRepository = PlayerRepository(context: context)
        let resourcesRepository = ResourcesRepository(context: context)
        
        // create enitity services with repositories
        armyService = ArmyService(context: context)
        cityService = CityService()
        mapService = MapService()
        marchService = MarchService()
        playerService = PlayerService(
            playerRepository: playerRepository,
            cityRepository: cityRepository,
            armyRepository: armyRepository,
            resourcesRepository: resourcesRepository
        )
        userService = UserService()
        worldService = WorldService(
            playerRepository: playerRepository,
            mapRepository: mapRepository,
            cityRepository: cityRepository
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
