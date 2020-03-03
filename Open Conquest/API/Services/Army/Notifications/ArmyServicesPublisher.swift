//
//  ArmyServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/28/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class ArmyServicesPublisher: APIPublisher {
    
    override init() {
        super.init()
    }
    
    // MARK: GAME PUBLISHING METHODS
    
    func didGetArmies(response: GetArmiesResponse) {
        let armies = response.getArmies()
        let notification = notificationFactory.buildNotification(name: .APIDidGetArmies, data: armies)
        post(notification: notification)
    }
    
}
