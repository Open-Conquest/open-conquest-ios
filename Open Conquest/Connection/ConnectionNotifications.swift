//
//  ConnectionNotifications.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/15/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

enum ConnectionNotifications: String
{
    case LoginSucceed = "connection-login-succeed"
    case LoginFailed = "connection-login-failed"

    case RegisterSucceed = "connection-register-succeed"
    case RegisterFailed = "connection-register-failed"

    case CreatePlayerSucceed = "connection-create-player-succeed"
    case CreatePlayerFailed = "connection-create-player-failed"
    
    case DidGetWorld = "connection-did-get-world"
}

extension Notification.Name
{
    static let ConnectionLoginSucceed = Notification.Name(rawValue: ConnectionNotifications.LoginSucceed.rawValue)
    static let ConnectionLoginFailed = Notification.Name(rawValue: ConnectionNotifications.LoginFailed.rawValue)
    
    static let ConnectionRegisterSucceed = Notification.Name(rawValue: ConnectionNotifications.RegisterSucceed.rawValue)
    static let ConnectionRegisterFailed = Notification.Name(rawValue: ConnectionNotifications.RegisterFailed.rawValue)
    
    static let ConnectionCreatePlayerSucceed = Notification.Name(rawValue: ConnectionNotifications.CreatePlayerSucceed.rawValue)
    static let ConnectionCreatePlayerFailed = Notification.Name(rawValue: ConnectionNotifications.CreatePlayerFailed.rawValue)
    
    static let ConnectionDidGetWorld = Notification.Name(rawValue: ConnectionNotifications.DidGetWorld.rawValue)
}
