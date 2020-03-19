//
//  ArmyServicePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/28/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class ArmyServicePublisher: Publisher {
    
    let gameNotificationFactory: GameNotificationFactory
    
    override init() {
        gameNotificationFactory = GameNotificationFactory()
        super.init()
    }
    
    // MARK: METHODS PUBLISHING TO SCENE
    
    func didGetArmies(armies: [Army]) {
//        let notification = gameNotificationFactory.buildDidGetEntityNotification(entityType: .army, entities: armies)
//        post(notification: notification)
    }
    
    // MARK: METHODS PUBLISHING TO API
    
    func tryGetArmies() {
//        let notification = gameNotificationFactory.buildTryGetEntityNotification(entityType: .army)
//        post(notification: notification)
    }
}
