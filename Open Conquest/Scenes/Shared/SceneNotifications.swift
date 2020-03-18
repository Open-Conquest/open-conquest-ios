//
//  SceneNotifications.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

enum SceneNotifications: String
{
    // Login Scene notifications
    case TryLogin = "scene-try-login"
    case TryRegister = "scene-try-register"
    
    // Create Player Scene notifications
    case TryCreatePlayer = "scene-try-create-player"

    // Loading Scene notifications
    case TryGetWorld = "scene-try-get-world"
}

extension Notification.Name
{
    // Login Scene notifications
    static let SceneTryLogin = Notification.Name(rawValue: SceneNotifications.TryLogin.rawValue)
    static let SceneTryRegister = Notification.Name(rawValue: SceneNotifications.TryRegister.rawValue)
    
    // Create Player Scene notifications
    static let SceneTryCreatePlayer = Notification.Name(rawValue: SceneNotifications.TryCreatePlayer.rawValue)
    
    // Loading Scene notifications
    static let SceneTryGetWorld = Notification.Name(rawValue: SceneNotifications.TryGetWorld.rawValue)
}

class SceneTryLoginData {
    let username: String
    let password: String
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

class SceneTryRegisterData {
    let username: String
    let password: String
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
