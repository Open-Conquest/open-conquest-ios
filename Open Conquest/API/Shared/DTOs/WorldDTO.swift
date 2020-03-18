//
//  WorldDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class WorldDTO {
    var map: MapDTO
    var cities: [CityDTO]
    var players: [PlayerDTO]
    
    init(json: JSON) {
        cities = [CityDTO]()
        players = [PlayerDTO]()
        
        // get map from response
        map = MapDTO(json: json["map"])
        
        // get cities from response
        let citiesJSON = json["cities"].array!
        for city in citiesJSON {
            cities.append(CityDTO(json: city))
        }
        
        // get players from response
        let playersJSON = json["players"].array!
        for player in playersJSON {
            players.append(PlayerDTO(json: player))
        }
    }
    
    func toEntity() -> World {
        var mapEntity = map.toEntity()
        
        // map players to entities
        var playerEntities = [Player]()
        for player in players {
            playerEntities.append(player.toEntity())
        }
        
        // map cities to entities
        var cityEntities = [City]()
        for city in cities {
            cityEntities.append(city.toEntity())
        }
        
        return World(map: mapEntity, players: playerEntities, cities: cityEntities)
    }
}
