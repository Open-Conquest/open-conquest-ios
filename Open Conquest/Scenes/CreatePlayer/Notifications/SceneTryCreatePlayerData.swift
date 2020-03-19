//
//  SceneTryCreatePlayerData.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class SceneTryCreatePlayerData {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
}
