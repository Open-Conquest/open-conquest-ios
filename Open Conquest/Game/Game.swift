//
//  Game.swift
//  Open Conquest
//
//  Created by zach on 6/27/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func gameUpdated()
}

class Game {
    var publisher: GamePublisher
    var api: API
    // component controllers
    var userComponent: UserComponent
    var mapComponent: MapComponent

    // MARK: INITIALIZATION METHODS
    
    init() {
        api = API()
        publisher = GamePublisher()
        // create all controllers
        userComponent = UserComponent()
        mapComponent = MapComponent()
    }
    
    func tryLogin(username: String, password: String) -> Bool {
        print("Game tryLogin")
        return userComponent.tryLogin(username: username, password: password)
    }
    
    func getMap() -> Map {
        return mapComponent.getMap()
    }
}
