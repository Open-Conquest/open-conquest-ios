//
//  GamePublisher.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class GamePublisher: Publisher {
    
    override init() {
        super.init()
    }

    func didLogin() {
        let name = Notification.Name.GameLoginSuccess
        let data : [AnyHashable: Any]? = nil
        let notification = notificationFactory.buildNotification(name: name, data: data)
        post(notification: notification)
    }
}
