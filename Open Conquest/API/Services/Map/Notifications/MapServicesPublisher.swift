//
//  MapServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MapServicesPublisher: APIPublisher {
    
    override init() {
        
    }
    
    // MARK: GAME PUBLISHING METHODS
    
    // did receive cities data from connection
    func didGetMap(map: [Map]) {
//        let notification = notificationFactory.buildNotification(name: .APIDidGetMap, data: map)
//        post(notification: notification)
    }
    
}
