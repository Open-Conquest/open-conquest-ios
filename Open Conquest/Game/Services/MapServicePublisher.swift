//
//  MapServicePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MapServicePublisher: Publisher {
    let gameNotificationFactory: GameNotificationFactory
    
    override init() {
        gameNotificationFactory = GameNotificationFactory()
    }
    
    // MARK: SCENE PUBLISHING METHODS
    
    func didGetMap(map: Map) {
        
        var mapData = [Map]()
        mapData.append(map)
        
        let notification = gameNotificationFactory.buildDidGetEntityNotification(entityType: .map, entities: mapData)
        post(notification: notification)
    }
    
    // MARK: API PUBLISHING METHODS
    
    func tryGetMap() {
        let notification = gameNotificationFactory.buildTryGetEntityNotification(entityType: .map)
        post(notification: notification)
    }
}
