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
    case DidGetArmies = "scene-did-get-armies"
    case DidGetCities = "scene-did-get-cities"
    case DidGetMap = "scene-did-get-map"
    case DidGetMarches = "scene-did-get-marches"
    case DidGetUsers = "scene-did-get-users"
    case TryCreatePlayer = "scene-try-create-player"
    case TryGetArmies = "scene-try-get-armies"
    case TryGetCities = "scene-try-get-cities"
    case TryGetMap = "scene-try-get-map"
    case TryGetMarches = "scene-try-get-marches"
    case TryGetUsers = "scene-try-get-users"
    case TryLogin = "scene-try-login"
    case TryRegister = "scene-try-register"
}

extension Notification.Name
{
    static let SceneDidGetArmies = Notification.Name(rawValue: SceneNotifications.DidGetArmies.rawValue)
    static let SceneDidGetCities = Notification.Name(rawValue: SceneNotifications.DidGetCities.rawValue)
    static let SceneDidGetMap = Notification.Name(rawValue: SceneNotifications.DidGetMap.rawValue)
    static let SceneDidGetMarches = Notification.Name(rawValue: SceneNotifications.DidGetMarches.rawValue)
    static let SceneDidGetUsers = Notification.Name(rawValue: SceneNotifications.DidGetUsers.rawValue)
    static let SceneTryCreatePlayer = Notification.Name(rawValue: SceneNotifications.TryCreatePlayer.rawValue)
    static let SceneTryGetArmies = Notification.Name(rawValue: SceneNotifications.TryGetArmies.rawValue)
    static let SceneTryGetCities = Notification.Name(rawValue: SceneNotifications.TryGetCities.rawValue)
    static let SceneTryGetMap = Notification.Name(rawValue: SceneNotifications.TryGetMap.rawValue)
    static let SceneTryGetMarches = Notification.Name(rawValue: SceneNotifications.TryGetMarches.rawValue)
    static let SceneTryGetUsers = Notification.Name(rawValue: SceneNotifications.TryGetUsers.rawValue)
    static let SceneTryLogin = Notification.Name(rawValue: SceneNotifications.TryLogin.rawValue)
    static let SceneTryRegister = Notification.Name(rawValue: SceneNotifications.TryRegister.rawValue)
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
