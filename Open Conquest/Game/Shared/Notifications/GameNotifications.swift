//
//  GameNotifications.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

enum GameNotifications: String
{
    case TryLogin = "game-try-login"
    case LoginSucceed = "game-login-succeed"
    case LoginFailed = "game-login-failed"
    
    case TryRegister = "game-try-register"
    case RegisterSucceed = "game-register-succeed"
    case RegisterFailed = "game-register-failed"
    
    case TryCreatePlayer = "game-try-create-player"
    case CreatePlayerSucceed = "game-try-create-player-succeed"
    case CreatePlayerFailed = "game-try-create-player-failed"
    
    case TryGetWorld = "game-try-get-world"
}

extension Notification.Name
{
    static let GameTryLogin = Notification.Name(rawValue: GameNotifications.TryLogin.rawValue)
    static let GameLoginSucceed = Notification.Name(rawValue: GameNotifications.LoginSucceed.rawValue)
    static let GameLoginFailed = Notification.Name(rawValue: GameNotifications.LoginFailed.rawValue)
    
    static let GameTryRegister = Notification.Name(rawValue: GameNotifications.TryRegister.rawValue)
    static let GameRegisterSucceed = Notification.Name(rawValue: GameNotifications.RegisterSucceed.rawValue)
    static let GameRegisterFailed = Notification.Name(rawValue: GameNotifications.RegisterFailed.rawValue)
    
    static let GameTryCreatePlayer = Notification.Name(rawValue: GameNotifications.TryCreatePlayer.rawValue)
    static let GameCreatePlayerSucceed = Notification.Name(rawValue: GameNotifications.CreatePlayerSucceed.rawValue)
    static let GameCreatePlayerFailed = Notification.Name(rawValue: GameNotifications.CreatePlayerFailed.rawValue)
    
    static let GameTryGetWorld = Notification.Name(rawValue: GameNotifications.TryGetWorld.rawValue)
}


class GameLoadData {
}

class GameGameLoaded {
}

