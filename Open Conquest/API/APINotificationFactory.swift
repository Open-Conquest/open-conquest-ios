//
//  APINotificationFactory.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class APINotificationFactory: NotificationFactory {

    override init() {
        super.init()
    }
    
    func buildAPITryLoginNotification(request: LoginRequest) -> Notification {
        return buildNotification(name: .APIMakeRequest, data: request)
    }
    
    func buildAPIGetComponentNotification(request: GetEntityRequest) -> Notification {
        return buildNotification(name: .APIMakeRequest, data: request)
    }
}
