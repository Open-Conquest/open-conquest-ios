//
//  GameNotificationFactory.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GameNotificationFactory: NotificationFactory {
    
    override init() {
        
    }
    
    func buildGameTryLoginNotification(data: SceneTryLoginData) -> Notification {
        let notifData = GameTryLoginData(data: data)
        return buildNotification(name: .GameTryLogin, data: notifData)
    }
    
    func buildGameLoginSucceedNotification() -> Notification {
        let data = GameLoginSucceedData()
        return buildNotification(name: .GameLoginSucceed, data: data)
    }
    
    func buildGameLoginFailedNotification(data: GameLoginFailedData) -> Notification {
        return buildNotification(name: .GameLoginFailed, data: data)
    }
    
    func buildGameTryRegisterNotification(data: SceneTryRegisterData) -> Notification {
        let notifData = GameTryRegisterData(data: data)
        return buildNotification(name: .GameTryRegister, data: notifData)
    }
    
    func buildGameRegisterSucceedNotification(data: GameRegisterSucceedData) -> Notification {
        return buildNotification(name: .GameRegisterSucceed, data: data)
    }
    
    func buildGameRegisterFailedNotification(data: GameRegisterFailedData) -> Notification {
        return buildNotification(name: .GameRegisterFailed, data: data)
    }
}
