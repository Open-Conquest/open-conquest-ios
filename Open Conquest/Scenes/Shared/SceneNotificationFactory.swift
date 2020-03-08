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
    
    func buildTryRegisterNotification(username: String, password: String) -> Notification {
        let data = SceneTryRegisterData(username: username, password: password)
        return buildNotification(name: .SceneTryRegister, data: data)
    }
    
    func buildGetEntityNotification(entity: GameEntityType) -> Notification {
        switch entity {
        case .army:
            return buildNotification(name: .SceneTryGetArmies, data: nil)
        case .city:
            return buildNotification(name: .SceneTryGetCities, data: nil)
        case .map:
            return buildNotification(name: .SceneTryGetMap, data: nil)
        case .march:
            return buildNotification(name: .SceneTryGetMarches, data: nil)
        case .user:
            return buildNotification(name: .SceneTryGetUsers, data: nil)
        default:
            fatalError()
        }
    }
}

