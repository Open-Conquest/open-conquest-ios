//
//  SceneNotificationFactory.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class SceneNotificationFactory: NotificationFactory {
    
    override init() {
        super.init()
    }
    
    func buildTryLoginNotification(username: String, password: String) -> Notification {
        let data = SceneTryLoginData(username: username, password: password)
        return buildNotification(name: .SceneTryLogin, data: data)
    }
    
    func buildTryRegisterNotification(username: String, password: String) -> Notification {
        let data = SceneTryRegisterData(username: username, password: password)
        return buildNotification(name: .SceneTryRegister, data: data)
    }
}

