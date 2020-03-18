//
//  WorldServicePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class WorldServicePublisher: GamePublisher {
    
    override init() {
        super.init()
    }
    
    func tryGetWorld() {
        let notification = notificationFactory.buildNotification(name: .GameTryGetWorld, data: nil)
        post(notification: notification)
    }
    
    func didGetWorld(world: World) {
        let notification = notificationFactory.buildNotification(name: .GameDidGetWorld, data: world)
        post(notification: notification)
    }
}
