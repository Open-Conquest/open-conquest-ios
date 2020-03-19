//
//  MarchServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MarchServicesPublisher: APIPublisher {
    
    override init() {
        
    }
    
    // MARK: GAME PUBLISHING METHODS
    
    // did receive cities data from connection
    func didGetMarches(marches: [March]) {
//        let notification = notificationFactory.buildNotification(name: .APIDidGetMarches, data: marches)
//        post(notification: notification)
    }
    
}
