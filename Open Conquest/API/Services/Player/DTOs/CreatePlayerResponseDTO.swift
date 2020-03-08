//
//  CreatePlayerResponseDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class CreatePlayerResponseDTO {
    let player: PlayerDTO
    let resources: ResourcesDTO
    let army: ArmyDTO
    let city: CityDTO
    
    /* Initialize CreatePlayerResponseDTO from generic message, expecting CreatePlayerResponse schema */
    init(response: Response) {
        let data = response.getData()
        player = PlayerDTO(json: data["player"])
        resources = ResourcesDTO(json: data["resources"])
        army = ArmyDTO(json: data["army"])
        city = CityDTO(json: data["city"])
    }
    
    func getPlayer() -> PlayerDTO {
        return player
    }
    
    func getResources() -> ResourcesDTO {
        return resources
    }
    
    func getArmy() -> ArmyDTO {
        return army
    }
    
    func getCity() -> CityDTO {
        return city
    }
}
