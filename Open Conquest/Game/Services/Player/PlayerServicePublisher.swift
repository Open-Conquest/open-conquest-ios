//
//  PlayerServicePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class PlayerServicePublisher: Publisher {
    
    let gameNotificationFactory: GameNotificationFactory
    
    override init() {
        gameNotificationFactory = GameNotificationFactory()
        super.init()
    }
    
    func tryCreatePlayer(player: Player) {
        let data = GameTryCreatePlayerData(player: player)
        let notification = gameNotificationFactory.buildNotification(name: .GameTryCreatePlayer, data: data)
        post(notification: notification)
    }
    
    func createPlayerSucceed() {
        let notification = gameNotificationFactory.buildNotification(name: .GameCreatePlayerSucceed, data: nil)
        post(notification: notification)
    }
    
//    func loginSucceed() {
//        let notification = gameNotificationFactory.buildGameLoginSucceedNotification()
//        post(notification: notification)
//    }
//
//    func loginFailed(message: String) {
//        let data = GameLoginFailedData(message: message)
//        let notification = gameNotificationFactory.buildGameLoginFailedNotification(data: data)
//        post(notification: notification)
//    }
}
