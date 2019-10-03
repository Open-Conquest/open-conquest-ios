//
//  LoadingScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoadingScenePublisher: Publisher {
    
    let sceneNotificationFactory: SceneNotificationFactory
    
    override init() {
        sceneNotificationFactory = SceneNotificationFactory()
        super.init()
    }
    
    func getAllGameComponents() {
        var notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.army)
        post(notification: notification)
        
        notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.city)
        post(notification: notification)
        
        notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.map)
        post(notification: notification)

        notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.march)
        post(notification: notification)
        
        notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.user)
        post(notification: notification)
    }
}
