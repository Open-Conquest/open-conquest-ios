//
//  ArmyComponentPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/28/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class ArmyComponentPublisher: Publisher {
    
    let gameNotificationFactory: GameNotificationFactory
    
    override init() {
        gameNotificationFactory = GameNotificationFactory()
        super.init()
    }
    
    // MARK: METHODS PUBLISHING TO SCENE
    
    func didGetArmies(armies: [Army]) {
        let notification = gameNotificationFactory.buildDidGetComponentNotification(componentType: .army, componentData: armies)
        post(notification: notification)
    }
    
    // MARK: METHODS PUBLISHING TO API
    
    func tryGetArmies() {
        let notification = gameNotificationFactory.buildTryGetComponentNotification(componentType: .army)
        post(notification: notification)
    }
}
