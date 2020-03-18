//
//  GetWorldResponseDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetWorldResponseDTO {
    let world: WorldDTO
    
    /* Initialize GetWorldResponseDTO from generic message, expecting GetWorldResponse schema */
    init(response: Response) {
        let data = response.getData()
        world = WorldDTO(json: data["world"])
    }
    
    func getWorld() -> WorldDTO {
        return world
    }
}
