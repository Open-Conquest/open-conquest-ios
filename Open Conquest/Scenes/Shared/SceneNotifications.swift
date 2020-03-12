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
    case TryLogin = "scene-try-login"
    case TryRegister = "scene-try-register"
    
    case TryCreatePlayer = "scene-try-create-player"
    
    case TryGetWorld = "scene-try-get-world"
}

extension Notification.Name
{
    static let SceneTryLogin = Notification.Name(rawValue: SceneNotifications.TryLogin.rawValue)
    static let SceneTryRegister = Notification.Name(rawValue: SceneNotifications.TryRegister.rawValue)
    
    static let SceneTryCreatePlayer = Notification.Name(rawValue: SceneNotifications.TryCreatePlayer.rawValue)
    
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
