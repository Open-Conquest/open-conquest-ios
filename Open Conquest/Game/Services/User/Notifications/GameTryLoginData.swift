//
//  GameTryLoginData.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class GameTryLoginData {
    let username: String
    let password: String
    init(data: SceneTryLoginData) {
        self.username = data.username
        self.password = data.password
    }
}
