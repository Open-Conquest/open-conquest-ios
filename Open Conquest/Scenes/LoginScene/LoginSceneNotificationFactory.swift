//
//  LoginSceneNotificationFactory.swift
//  Open Conquest
//
//  Created by zach on 6/28/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoginSceneNotificationFactory: NotificationFactory {
    
    override init() {
        super.init()
    }
    
    func buildTryLoginNotification(username: String, password: String) -> Notification
    {
        let loginData = ["username": username,
                         "password": password]
        let notification = Notification(name: .SceneTryLogin, object: nil, userInfo: loginData)
        return notification
    }
}
