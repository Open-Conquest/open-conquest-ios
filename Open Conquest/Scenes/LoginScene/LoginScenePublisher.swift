//
//  LoginScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/2/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoginScenePublisher: Publisher {
    
    override init() {
        super.init()
    }
    
    func tryLogin(username: String, password: String) {
        let name = Notification.Name.SceneTryLogin
        let data : [AnyHashable: Any]? = nil
        let notification = notificationFactory.buildNotification(name: name, data: data)
        post(notification: notification)
    }
}
