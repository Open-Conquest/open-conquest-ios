//
//  MarchComponentPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MarchComponentPublisher: Publisher {
    let gameNotificationFactory: GameNotificationFactory
    
    override init() {
        gameNotificationFactory = GameNotificationFactory()
        super.init()
    }
    
    // MARK: METHODS PUBLISHING TO SCENE
    
    func didGetMarches(marches: [March]) {
        
        let notification = gameNotificationFactory.buildDidGetComponentNotification(componentType: .march, componentData: marches)
        post(notification: notification)
    }
    
    // MARK: METHODS PUBLISHING TO API
    
    func tryGetMarches() {
        
        let notification = gameNotificationFactory.buildTryGetComponentNotification(componentType: .march)
        post(notification: notification)
    }
}
