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
    case LoginSucceed   = "api-login-succeed"
    case LoginFailed    = "api-login-failed"
    case RegisterSucceed   = "api-register-succeed"
    case RegisterFailed    = "api-register-failed"
    
    case DidGetArmies   = "api-did-get-armies"
    case DidGetCities   = "api-did-get-cities"
    case DidGetMap      = "api-did-get-map"
    case DidGetMarches  = "api-did-get-marches"
    case DidGetUsers    = "api-did-get-users"
}

extension Notification.Name
{
    // only request that is observed by the connection
    static let APIMakeRequest   = Notification.Name(rawValue: APINotifications.MakeRequest.rawValue)
    
    // all of these are observed by the game components
    static let APILoginSucceed  = Notification.Name(rawValue: APINotifications.LoginSucceed.rawValue)
    static let APILoginFailed   = Notification.Name(rawValue: APINotifications.LoginFailed.rawValue)
    static let APIRegisterSucceed  = Notification.Name(rawValue: APINotifications.RegisterSucceed.rawValue)
    static let APIRegisterFailed   = Notification.Name(rawValue: APINotifications.RegisterFailed.rawValue)
    
    static let APIDidGetArmies  = Notification.Name(rawValue: APINotifications.DidGetArmies.rawValue)
    static let APIDidGetCities  = Notification.Name(rawValue: APINotifications.DidGetCities.rawValue)
    static let APIDidGetMap     = Notification.Name(rawValue: APINotifications.DidGetMap.rawValue)
    static let APIDidGetMarches = Notification.Name(rawValue: APINotifications.DidGetMarches.rawValue)
    static let APIDidGetUsers   = Notification.Name(rawValue: APINotifications.DidGetUsers.rawValue)
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
