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
    
    // TODO: add query
    func buildTryGetComponentNotification(componentType: GameComponents) -> Notification {
        let query = JSON()
        switch componentType {
        case GameComponents.army:
            return buildNotification(name: .GameTryGetArmies, data: query)
        case GameComponents.city:
            return buildNotification(name: .GameTryGetCities, data: query)
        case GameComponents.map:
            return buildNotification(name: .GameTryGetMap, data: query)
        case GameComponents.march:
            return buildNotification(name: .GameTryGetMarches, data: query)
        case GameComponents.user:
            return buildNotification(name: .GameTryGetUsers, data: query)
        }
    }
    
    func buildDidGetComponentNotification(componentType: GameComponents, componentData: [GameComponentModel]) -> Notification {
        switch componentType {
        case GameComponents.army:
            return buildNotification(name: .GameDidGetArmies, data: componentData)
        case GameComponents.city:
            return buildNotification(name: .GameDidGetCities, data: componentData)
        case GameComponents.map:
            return buildNotification(name: .GameDidGetMap, data: componentData)
        case GameComponents.march:
            return buildNotification(name: .GameDidGetMarches, data: componentData)
        case GameComponents.user:
            return buildNotification(name: .GameDidGetUsers, data: componentData)
        }
    }
    
}
