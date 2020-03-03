//
//  APIPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class APIPublisher: Publisher {
    
    var apiNotificationFactory: APINotificationFactory
    
    override init() {
        apiNotificationFactory = APINotificationFactory()
        super.init()
    }
    
    // MARK: CONNECTION PUBLISHING METHODS
    
    func makeRequest(request: Request) {
        let notification = notificationFactory.buildNotification(name: .APIMakeRequest, data: request)
        post(notification: notification)
    }
}
