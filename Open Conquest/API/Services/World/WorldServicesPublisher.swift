//
//  WorldServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class WorldServicesPublisher: APIPublisher {
    
    override init() {
        super.init()
    }
    
    func tryGetWorld(request: GetWorldRequestDTO) {
        let notification = notificationFactory.buildNotification(name: .APIMakeRequest, data: request)
        post(notification: notification)
    }
    
    func didGetWorld(world: World) {
        let notification = notificationFactory.buildNotification(name: .APIDidGetWorld, data: world)
        post(notification: notification)
    }
}
