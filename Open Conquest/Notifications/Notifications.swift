//
//  Notifications.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

enum SceneNotifications: String
{
    case TryLogin = "scene-try-login"
    case LoginSuccess = "scene-login-success"
}

enum GameNotifications: String
{
    case TryLogin = "game-try-login"
    case LoginSuccess = "game-login-success"
}


extension Notification.Name
{
    static let SceneTryLogin = Notification.Name(rawValue: SceneNotifications.TryLogin.rawValue)
    static let GameTryLogin = Notification.Name(rawValue: GameNotifications.TryLogin.rawValue)
    
    static let SceneLoginSuccess = Notification.Name(rawValue: SceneNotifications.LoginSuccess.rawValue)
    static let GameLoginSuccess = Notification.Name(rawValue: GameNotifications.LoginSuccess.rawValue)
}
