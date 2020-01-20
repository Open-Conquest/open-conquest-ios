//
//  UserServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/2/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserServicesPublisher: Publisher {
    
    let apiNotificationFactory: APINotificationFactory
    
    override init() {
        apiNotificationFactory = APINotificationFactory()
        super.init()
    }
    
    // MARK: CONNECTION PUBLISHING METHODS
    
    func tryLogin(gameTryLoginData: GameTryLoginData) {
        let request = LoginRequest(gameTryLoginData: gameTryLoginData)
        let notification = apiNotificationFactory.buildAPITryLoginNotification(request: request)
        post(notification: notification)
    }
    
    func getUsers() {
        let request = GetEntityRequest(entity: .user)
        let notification = apiNotificationFactory.buildAPIGetComponentNotification(request: request)
        post(notification: notification)
    }
    
    // MARK: GAME PUBLISHING METHODS
    
    func loginSucceeded(username: String) {
        let data    = APILoginSucceedData(username: username)
        let notif   = notificationFactory.buildNotification(name: .APILoginSucceed, data: data)
        post(notification: notif)
    }
    
    func loginFailed() {
        let notification = notificationFactory.buildNotification(name: .APILoginFailed, data: nil)
        post(notification: notification)
    }
    
    func didGetUsers(response: GetUsersResponse) {
        let users = response.getUsers()
        let notification = notificationFactory.buildNotification(name: .APIDidGetUsers, data: users)
        post(notification: notification)
    }
    
}
