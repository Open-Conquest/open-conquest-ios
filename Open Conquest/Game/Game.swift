//
//  Game.swift
//  Open Conquest
//
//  Created by zach on 6/27/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class Game {
    var subscriber:     Subscriber
    var gamePublisher:  GamePublisher
    
    var armyComponent:  ArmyComponent
    var cityComponent:  CityComponent
    var mapComponent:   MapComponent
    var marchComponent: MarchComponent
    var userComponent:  UserComponent

    init() {
        subscriber      = Subscriber()
        gamePublisher   = GamePublisher()
        
        armyComponent   = ArmyComponent()
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
