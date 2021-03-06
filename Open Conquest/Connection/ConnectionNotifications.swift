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
    case LoginSucceed   = "connection-login-succeed"
    case LoginFailed    = "connection-login-failed"
    
    case DidGetArmies   = "connection-did-get-armies"
    case DidGetCities   = "connection-did-get-cities"
    case DidGetMap      = "connection-did-get-map"
    case DidGetMarches  = "connection-did-get-marches"
    case DidGetUsers    = "connection-did-get-users"
}

extension Notification.Name
{
    static let ConnectionLoginSucceed   = Notification.Name(rawValue: ConnectionNotifications.LoginSucceed.rawValue)
    static let ConnectionLoginFailed    = Notification.Name(rawValue: ConnectionNotifications.LoginFailed.rawValue)
    
    static let ConnectionDidGetArmies   = Notification.Name(rawValue: ConnectionNotifications.DidGetArmies.rawValue)
    static let ConnectionDidGetCities   = Notification.Name(rawValue: ConnectionNotifications.DidGetCities.rawValue)
    static let ConnectionDidGetMap      = Notification.Name(rawValue: ConnectionNotifications.DidGetMap.rawValue)
    static let ConnectionDidGetMarches  = Notification.Name(rawValue: ConnectionNotifications.DidGetMarches.rawValue)
    static let ConnectionDidGetUsers    = Notification.Name(rawValue: ConnectionNotifications.DidGetUsers.rawValue)
}
