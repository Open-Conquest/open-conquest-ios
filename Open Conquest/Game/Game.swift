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
    var context: NSManagedObjectContext
    
    var armyController: ArmyController
    var cityComponent:  CityComponent
    var mapComponent:   MapComponent
    var marchComponent: MarchComponent
    var userComponent:  UserComponent

    init(dataContext: NSManagedObjectContext) {
        context         = dataContext
        subscriber      = Subscriber()
        gamePublisher   = GamePublisher()
        
        armyController  = ArmyController(context: context)
        cityComponent   = CityComponent()
        mapComponent    = MapComponent()
        marchComponent  = MarchComponent()
        userComponent   = UserComponent()
        
        print("Game intialized")
    }
}

enum GameComponents: String {
    case army   = "army"
    case city   = "city"
    case map    = "map"
    case march  = "march"
    case user   = "user"
}
