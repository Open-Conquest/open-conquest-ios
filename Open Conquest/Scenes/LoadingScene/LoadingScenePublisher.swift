//
//  LoadingScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoadingScenePublisher: ScenePublisher {
    
    override init() {
        super.init()
    }
    
    func getAllGameComponents() {
        getArmies()
        getCities()
        getMap()
        getMarches()
        getUsers()
    }
}
