//
//  CityServicePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class CityServicePublisher: Publisher {
    var gameNotificationFactory: GameNotificationFactory
    
    override init() {
        gameNotificationFactory = GameNotificationFactory()
    }
    
    // MARK: METHODS PUBLISHING TO SCENE
    
    func didGetCities(cities: [City]) {
        let notification = gameNotificationFactory.buildDidGetEntityNotification(entityType: .city, entities: cities)
        post(notification: notification)
    }
    
    // MARK: METHODS PUBLISHING TO API
    
    func tryGetCities() {
        let notification = gameNotificationFactory.buildTryGetEntityNotification(entityType: .city)
        post(notification: notification)
    }
    
}
