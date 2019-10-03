//
//  NotificationFactory.swift
//  Open Conquest
//
//  Created by zach on 6/28/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class NotificationFactory {
    
    init() {}
    
    func buildNotification(name: Notification.Name, data: Any?) -> Notification {
        return Notification(name: name, object: nil, userInfo: ["data": data])
    }
}
