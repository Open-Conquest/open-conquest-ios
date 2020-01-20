//
//  UserServicePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/7/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserServicePublisher: Publisher {
    
    let gameNotificationFactory: GameNotificationFactory
    
    override init() {
        gameNotificationFactory = GameNotificationFactory()
        super.init()
    }
    
    func tryLogin(data: SceneTryLoginData) {
        let notification = gameNotificationFactory.buildGameTryLoginNotification(data: data)
        post(notification: notification)
    }
    
    func loginSucceed() {
        let notification = gameNotificationFactory.buildGameLoginSucceedNotification()
        post(notification: notification)
    }
    
    func didGetUsers(users: [User]) {
        let notification = gameNotificationFactory.buildDidGetEntityNotification(entityType: .user, entities: users)
        post(notification: notification)
    }
    
    func tryGetUsers() {
        let notification = gameNotificationFactory.buildTryGetEntityNotification(entityType: .user)
        post(notification: notification)
    }
}
