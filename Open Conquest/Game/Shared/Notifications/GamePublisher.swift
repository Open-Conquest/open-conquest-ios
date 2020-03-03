//
//  GamePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class GamePublisher: Publisher {
    
    override init() {
        super.init()
    }
    
//    // asks each component to load themselves
//    func loadGame(username: String) {
//        print("Game publishing GameLoadGame event...")
//        let name = Notification.Name.GameLoadGame
//        let data : [AnyHashable: Any]? = ["username": username]
//        let notification = notificationFactory.buildNotification(name: name, data: data)
//        post(notification: notification)
//    }
//
//    func gameLoaded() {
//        print("Game publishing GameGameLoaded event...")
////        let name = Notification.Name.GameGameLoaded
////        let notification = notificationFactory.buildNotification(name: name, data: nil)
////        post(notification: notification)
//    }
}
