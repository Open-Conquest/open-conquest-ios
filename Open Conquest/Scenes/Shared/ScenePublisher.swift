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
        let notification = sceneNotificationFactory.buildGetEntityNotification(entity: .army)
        post(notification: notification)
    }
    
    func getCities() {
        let notification = sceneNotificationFactory.buildGetEntityNotification(entity: .city)
        post(notification: notification)
    }
    
    func getMap() {
        let notification = sceneNotificationFactory.buildGetEntityNotification(entity: .map)
        post(notification: notification)
    }
    
    func getMarches() {
        let notification = sceneNotificationFactory.buildGetEntityNotification(entity: .march)
        post(notification: notification)
    }
    
    func getUsers() {
        let notification = sceneNotificationFactory.buildGetEntityNotification(entity: .user)
        post(notification: notification)
    }
    
}
