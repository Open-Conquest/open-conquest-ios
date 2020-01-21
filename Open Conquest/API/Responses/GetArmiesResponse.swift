//
//  GetArmiesResponse.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class GetArmiesResponse {
    
    var armies: [Army] = [Army]()
    
    init(response: Response) {
        for army in response.getData().array! {
            let newArmy = Army(json: army)
            self.armies.append(newArmy)
        }
    }
    
    func getArmies() -> [Army] {
        return self.armies
    }
}
