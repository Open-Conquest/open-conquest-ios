//
//  LoginScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/2/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoginScenePublisher: ScenePublisher {
    
    override init() {
        super.init()
    }
    
    func tryLogin(username: String, password: String) {
        let notification = sceneNotificationFactory.buildTryLoginNotification(username: username, password: password) as! Notification
        post(notification: notification)
    }
    
    func tryRegister(username: String, password: String) {
        let notification = sceneNotificationFactory.buildTryRegisterNotification(username: username, password: password) as! Notification
        post(notification: notification)
    }
}
 
