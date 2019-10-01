//
//  Notifications.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

// MARK: SCENE NOTIFICATIONS

enum SceneNotifications: String
{
    case TryLogin = "scene-try-login"
}

extension Notification.Name
{
    static let SceneTryLogin = Notification.Name(rawValue: SceneNotifications.TryLogin.rawValue)
}

// MARK: GAME NOTIFICATIONS

enum GameNotifications: String
{
    case LoginSuccess = "game-login-success"
    case MapUpdate = "map-update"
}

extension Notification.Name
{
    static let GameLoginSuccess = Notification.Name(rawValue: GameNotifications.LoginSuccess.rawValue)
    static let GameMapUpdate = Notification.Name(rawValue: GameNotifications.MapUpdate.rawValue)
}
