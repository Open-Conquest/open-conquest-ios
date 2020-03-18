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
    
    func tryGetWorld() {
        let notification = sceneNotificationFactory.buildNotification(name: .SceneTryGetWorld, data: nil)
        post(notification: notification)
    }
}
