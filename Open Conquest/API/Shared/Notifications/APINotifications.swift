//
//  APINotifications.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/12/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

enum APINotifications: String
{
    // only request that is observed by the connection
    case MakeRequest    = "api-make-request"
    
    // all of these are observed by the game components
    case LoginSucceed = "api-login-succeed"
    case LoginFailed = "api-login-failed"
    case RegisterSucceed = "api-register-succeed"
    case RegisterFailed = "api-register-failed"
    
    case CreatePlayerSucceed = "api-create-player-succeed"
    case CreatePlayerFailed = "api-create-player-failed"
    
    case DidGetWorld = "api-did-get-world"
}

extension Notification.Name
{
    // only request that is observed by the connection
    static let APIMakeRequest = Notification.Name(rawValue: APINotifications.MakeRequest.rawValue)
    
    // all of these are observed by the game components
    static let APILoginSucceed  = Notification.Name(rawValue: APINotifications.LoginSucceed.rawValue)
    static let APILoginFailed = Notification.Name(rawValue: APINotifications.LoginFailed.rawValue)
    static let APIRegisterSucceed = Notification.Name(rawValue: APINotifications.RegisterSucceed.rawValue)
    static let APIRegisterFailed = Notification.Name(rawValue: APINotifications.RegisterFailed.rawValue)
    
    static let APICreatePlayerSucceed = Notification.Name(rawValue: APINotifications.CreatePlayerSucceed.rawValue)
    static let APICreatePlayerFailed = Notification.Name(rawValue: APINotifications.CreatePlayerFailed.rawValue)
    
    static let APIDidGetWorld = Notification.Name(rawValue: APINotifications.DidGetWorld.rawValue)
}

class APIMakeRequestData {
    let service: String
    let operation: String
    let body: JSON
    init(service: String, operation: String, body: JSON) {
        self.service = service
        self.operation = operation
        self.body = body
    }
}



class APIDidGetUsersData {
    
}
