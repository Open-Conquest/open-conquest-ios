//
//  PlayerServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class PlayerServicesPublisher: Publisher {
    
    let apiNotificationFactory: APINotificationFactory
    
    override init() {
        apiNotificationFactory = APINotificationFactory()
        super.init()
    }
    
    // MARK: CONNECTION PUBLISHING METHODS
    
//    func tryCreatePlayer(data: GameTryLoginData) {
//        let request = LoginRequest(gameTryLoginData: gameTryLoginData)
//        let notification = apiNotificationFactory.buildAPITryLoginNotification(request: request)
//        post(notification: notification)
//    }
    
    // MARK: GAME PUBLISHING METHODS
    
//    func loginSucceeded(response: LoginUserResponseDTO) {
//        let data    = APILoginSucceedData(username: response.getUsername())
//        let notif   = notificationFactory.buildNotification(name: .APILoginSucceed, data: data)
//        post(notification: notif)
//    }
}