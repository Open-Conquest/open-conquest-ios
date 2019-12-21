//
//  ScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/21/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class ScenePublisher: Publisher {
    
    let sceneNotificationFactory: SceneNotificationFactory
    
    override init() {
        sceneNotificationFactory = SceneNotificationFactory()
    }
    
    func getArmies() {
        let notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.army)
        post(notification: notification)
    }
    
    func getCities() {
        let notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.city)
        post(notification: notification)
    }
    
    func getMap() {
        let notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.city)
        post(notification: notification)
    }
    
    func getMarches() {
        let notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.march)
        post(notification: notification)
    }
    
    func getUsers() {
        let notification = sceneNotificationFactory.buildGetComponentNotification(component: GameComponents.user)
        post(notification: notification)
    }
    
}
