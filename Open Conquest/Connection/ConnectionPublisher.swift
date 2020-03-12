//
//  ConnectionPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class ConnectionPublisher: Publisher {
    
    override init() {
        super.init()
    }
    
    func publishArmyResponse(response: Response) {
        var notification: Notification
        switch response.getOperation() {
        case APIOperations.get:
            notification = notificationFactory.buildNotification(name: .ConnectionDidGetArmies, data: response)
        default:
            fatalError("Unexpected operation \(response.getOperation())")
        }
        post(notification: notification)
    }
    
    func publishCityResponse(response: Response) {
        var notification: Notification
        switch response.getOperation() {
        case APIOperations.get:
            notification = notificationFactory.buildNotification(name: .ConnectionDidGetCities, data: response)
        default:
            fatalError("Unexpected operation \(response.getOperation())")
        }
        post(notification: notification)
    }
    
    func publishMapResponse(response: Response) {
        var notification: Notification
        switch response.getOperation() {
        case APIOperations.get:
            notification = notificationFactory.buildNotification(name: .ConnectionDidGetMap, data: response)
        default:
            fatalError("Unexpected operation \(response.getOperation())")
        }
        post(notification: notification)
    }
    
    func publishMarchResponse(response: Response) {
        var notification: Notification
        switch response.getOperation() {
        case APIOperations.get:
            notification = notificationFactory.buildNotification(name: .ConnectionDidGetMarches, data: response)
        default:
            fatalError("Unexpected operation \(response.getOperation())")
        }
        post(notification: notification)
    }
    
    func publishUserResponse(response: Response) {
        var notification: Notification
        switch response.getOperation() {
        case APIOperations.LoginUser:
            notification = notificationFactory.buildNotification(name: .ConnectionLoginSucceed, data: response)
        case APIOperations.LoginUserError:
            notification = notificationFactory.buildNotification(name: .ConnectionLoginFailed, data: response)
        case APIOperations.RegisterUser:
            notification = notificationFactory.buildNotification(name: .ConnectionRegisterSucceed, data: response)
        case APIOperations.RegisterUserError:
            notification = notificationFactory.buildNotification(name: .ConnectionRegisterFailed, data: response)
        case APIOperations.get:
            notification = notificationFactory.buildNotification(name: .ConnectionDidGetUsers, data: response)
        default:
            fatalError("Unexpected operation \(response.getOperation())")
        }
        post(notification: notification)
    }
    
    func publishPlayerResponse(response: Response) {
        var notification: Notification
        switch response.getOperation() {
            case APIOperations.CreatePlayer:
                notification = notificationFactory.buildNotification(name: .ConnectionCreatePlayerSucceed, data: response)
            case APIOperations.CreatePlayerError:
                notification = notificationFactory.buildNotification(name: .ConnectionCreatePlayerFailed, data: response)
            default:
                fatalError("Unexpected operation \(response.getOperation())")
        }
        post(notification: notification)
    }
}
