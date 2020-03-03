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
    case TryLogin           = "game-try-login"
    case LoginSucceed       = "game-login-succeed"
    case LoginFailed        = "game-login-failed"
    case TryRegister        = "game-try-register"
    case RegisterSucceed    = "game-register-succeed"
    case RegisterFailed     = "game-register-failed"
    case LoadGame           = "game-load-game"
    
    case TryGetArmies       = "game-try-get-armies"
    case TryGetCities       = "game-try-get-cities"
    case TryGetMap          = "game-try-get-map"
    case TryGetMarches      = "game-try-get-marches"
    case TryGetUsers        = "game-try-get-users"
    
    case DidGetArmies       = "game-did-get-armies"
    case DidGetCities       = "game-did-get-cities"
    case DidGetMap          = "game-did-get-map"
    case DidGetMarches      = "game-did-get-marches"
    case DidGetUsers        = "game-did-get-users"
}

extension Notification.Name
{
    static let GameTryLogin         = Notification.Name(rawValue: GameNotifications.TryLogin.rawValue)
    static let GameLoginSucceed     = Notification.Name(rawValue: GameNotifications.LoginSucceed.rawValue)
    static let GameLoginFailed      = Notification.Name(rawValue: GameNotifications.LoginFailed.rawValue)
    static let GameTryRegister      = Notification.Name(rawValue: GameNotifications.TryRegister.rawValue)
    static let GameRegisterSucceed  = Notification.Name(rawValue: GameNotifications.RegisterSucceed.rawValue)
    static let GameRegisterFailed   = Notification.Name(rawValue: GameNotifications.RegisterFailed.rawValue)
    static let GameLoadGame         = Notification.Name(rawValue: GameNotifications.LoadGame.rawValue)
    
    static let GameTryGetArmies     = Notification.Name(rawValue: GameNotifications.TryGetArmies.rawValue)
    static let GameTryGetCities     = Notification.Name(rawValue: GameNotifications.TryGetCities.rawValue)
    static let GameTryGetMap        = Notification.Name(rawValue: GameNotifications.TryGetMap.rawValue)
    static let GameTryGetMarches    = Notification.Name(rawValue: GameNotifications.TryGetMarches.rawValue)
    static let GameTryGetUsers      = Notification.Name(rawValue: GameNotifications.TryGetUsers.rawValue)
    
    static let GameDidGetArmies     = Notification.Name(rawValue: GameNotifications.DidGetArmies.rawValue)
    static let GameDidGetCities     = Notification.Name(rawValue: GameNotifications.DidGetCities.rawValue)
    static let GameDidGetMap        = Notification.Name(rawValue: GameNotifications.DidGetMap.rawValue)
    static let GameDidGetMarches    = Notification.Name(rawValue: GameNotifications.DidGetMarches.rawValue)
    static let GameDidGetUsers      = Notification.Name(rawValue: GameNotifications.DidGetUsers.rawValue)
}


class GameLoadData {
}

class GameGameLoaded {
}

