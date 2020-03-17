//
//  CityServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/17/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class CityServicesPublisher: APIPublisher {
    
    override init() {
        
    }
    
    // MARK: GAME PUBLISHING METHODS
    
    // did receive cities data from connection
    func didGetCities(cities: [City]) {
//        let notification = notificationFactory.buildNotification(name: .APIDidGetCities, data: cities)
//        post(notification: notification)
    }
    
}
