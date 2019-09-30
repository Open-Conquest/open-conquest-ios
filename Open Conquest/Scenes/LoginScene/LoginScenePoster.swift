//
//  LoginScenePoster.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoginScenePoster: Poster {
    
    var notificationFactory: LoginSceneNotificationFactory
    
    override init() {
        notificationFactory = LoginSceneNotificationFactory()
        super.init()
    }
    
    func tryLogin(username: String, password: String) {
        let tryLoginNotification = notificationFactory.buildTryLoginNotification(username: username, password: password)
        post(notification: tryLoginNotification)
    }
}
