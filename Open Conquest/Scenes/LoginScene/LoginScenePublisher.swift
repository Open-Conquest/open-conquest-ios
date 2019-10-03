//
//  LoginScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/2/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoginScenePublisher: Publisher {
    
    let sceneNotificationFactory: SceneNotificationFactory
    
    override init() {
        self.sceneNotificationFactory = SceneNotificationFactory()
        super.init()
    }
    
    func tryLogin(username: String, password: String) {
        let notification = sceneNotificationFactory.buildTryLoginNotification(username: username, password: password) as! Notification
//        let name = Notification.Name.SceneTryLogin
//        let data : [AnyHashable: Any]? = ["username": username, "password": password]
//        let notification = notificationFactory.buildNotification(name: name, data: data)
        post(notification: notification)
    }
}
