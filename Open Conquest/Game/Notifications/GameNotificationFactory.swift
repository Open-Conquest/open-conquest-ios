//
//  GameNotificationFactory.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GameNotificationFactory: NotificationFactory {
    
    override init() {
        
    }
    
    func buildGameTryLoginNotification(data: SceneTryLoginData) -> Notification {
        let notifData = GameTryLoginData(data: data)
        return buildNotification(name: .GameTryLogin, data: notifData)
    }
    
    func buildGameLoginSucceedNotification() -> Notification {
        let data = GameLoginSucceedData()
        return buildNotification(name: .GameLoginSucceed, data: data)
    }
    
    func buildGameLoginFailedNotification(data: GameLoginFailedData) -> Notification {
        return buildNotification(name: .GameLoginFailed, data: data)
    }
    
    func buildGameTryRegisterNotification(data: SceneTryRegisterData) -> Notification {
        let notifData = GameTryRegisterData(data: data)
        return buildNotification(name: .GameTryRegister, data: notifData)
    }
    
    // TODO: add query
    func buildTryGetEntityNotification(entityType: GameEntityType) -> Notification {
        let query = JSON()
        switch entityType {
        case .army:
            return buildNotification(name: .GameTryGetArmies, data: query)
        case .city:
            return buildNotification(name: .GameTryGetCities, data: query)
        case .map:
            return buildNotification(name: .GameTryGetMap, data: query)
        case .march:
            return buildNotification(name: .GameTryGetMarches, data: query)
        case .user:
            return buildNotification(name: .GameTryGetUsers, data: query)
        }
    }
    
    func buildDidGetEntityNotification(entityType: GameEntityType, entities: [GameEntity]) -> Notification {
        switch entityType {
        case .army:
            return buildNotification(name: .GameDidGetArmies, data: entities)
        case .city:
            return buildNotification(name: .GameDidGetCities, data: entities)
        case .map:
            return buildNotification(name: .GameDidGetMap, data: entities)
        case .march:
            return buildNotification(name: .GameDidGetMarches, data: entities)
        case .user:
            return buildNotification(name: .GameDidGetUsers, data: entities)
        }
    }
    
}
