//
//  UserServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/2/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserServicesPublisher: Publisher {
    
    override init() {
        super.init()
    }
    
    func postLogin(username: String, password: String) {
        let loginData: [String: String] = ["username": username, "password": password]
        let notification = notificationFactory.buildNotification(name: .GameLoginSuccess, data: loginData)
        post(notification: notification)
    }
    
}
