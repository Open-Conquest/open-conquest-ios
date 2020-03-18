//
//  World.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class World {
    var map: Map
    var players: [Player]
    var cities : [City]
    
    init(map: Map, players: [Player], cities: [City]) {
        self.map = map
        self.players = players
        self.cities = cities
    }
}
