//
//  CreatePlayerScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class CreatePlayerScenePublisher: ScenePublisher {
    
    override init() {
        super.init()
    }
    
    func tryCreatePlayer(name: String) {
        let data = SceneTryCreatePlayerData(name: name)
        let notification = sceneNotificationFactory.buildNotification(name: .SceneTryCreatePlayer, data: data)
        post(notification: notification)
    }
}
