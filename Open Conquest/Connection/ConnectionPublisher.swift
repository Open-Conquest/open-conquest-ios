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
        case APIOperations.login:
            notification = notificationFactory.buildNotification(name: .ConnectionLoginSucceed, data: response)
        case APIOperations.get:
            notification = notificationFactory.buildNotification(name: .ConnectionDidGetUsers, data: response)
        default:
            fatalError("Unexpected operation \(response.getOperation())")
        }
        post(notification: notification)
    }
}
