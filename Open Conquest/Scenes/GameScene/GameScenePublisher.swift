//
//  GameScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/20/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class GameScenePublisher: ScenePublisher {
    
    override init() {
    }
    
    func tryGetWorld() {
        let notification = sceneNotificationFactory.buildNotification(name: .SceneTryGetWorld, data: nil)
        post(notification: notification)
    }
}
