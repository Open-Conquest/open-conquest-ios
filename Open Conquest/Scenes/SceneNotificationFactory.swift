//
//  SceneNotificationFactory.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class SceneNotificationFactory: NotificationFactory {
    
    override init() {
        super.init()
    }
    
    func buildTryLoginNotification(username: String, password: String) -> Notification {
        let data = SceneTryLoginData(username: username, password: password)
        return buildNotification(name: .SceneTryLogin, data: data)
    }
    
    func buildGetComponentNotification(component: GameComponents) -> Notification {
        switch component {
        case GameComponents.army:
            return buildNotification(name: .SceneTryGetArmies, data: nil)
        case GameComponents.city:
            return buildNotification(name: .SceneTryGetCities, data: nil)
        case GameComponents.map:
            return buildNotification(name: .SceneTryGetMap, data: nil)
        case GameComponents.march:
            return buildNotification(name: .SceneTryGetMarches, data: nil)
        case GameComponents.user:
            return buildNotification(name: .SceneTryGetUsers, data: nil)
        }
    }
}

