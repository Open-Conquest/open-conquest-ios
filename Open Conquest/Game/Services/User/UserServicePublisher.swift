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
    func tryRegister(data: SceneTryRegisterData) {
        let notification = gameNotificationFactory.buildGameTryRegisterNotification(data: data)
        post(notification: notification)
    }
    
    func registerSucceed(user: User) {
        let data = GameRegisterSucceedData(username: user.getUsername())
        let notification = gameNotificationFactory.buildGameRegisterSucceedNotification(data: data)
        post(notification: notification)
    }
    
    func registerFailed(message: String) {
        let data = GameRegisterFailedData(message: message)
        let notification = gameNotificationFactory.buildGameRegisterFailedNotification(data: data)
        post(notification: notification)
    }
    
    func tryLogin(data: SceneTryLoginData) {
        let notification = gameNotificationFactory.buildGameTryLoginNotification(data: data)
        post(notification: notification)
    }
    
    func loginSucceed() {
        let notification = gameNotificationFactory.buildGameLoginSucceedNotification()
        post(notification: notification)
    }
    
    func loginFailed(message: String) {
        let data = GameLoginFailedData(message: message)
        let notification = gameNotificationFactory.buildGameLoginFailedNotification(data: data)
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
