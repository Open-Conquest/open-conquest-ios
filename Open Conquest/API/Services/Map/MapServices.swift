//
//  MapServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MapServices {
    var publisher:  MapServicesPublisher
    var subscriber: Subscriber
    
    init() {
        publisher = MapServicesPublisher()
        subscriber = Subscriber()
        
        setupSubscribers()
    }
    
    func setupSubscribers() {
        
        subscriber.subscribe(observingFunction: tryGetmap(_:), name: .GameTryGetMap)
        
        subscriber.subscribe(observingFunction: didGetmap(_:), name: .ConnectionDidGetMap)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    func tryGetmap(_ notification: Notification) {
        print("MapService did recieve GameTryGetmap event")
        
        let request = GetEntityRequest(entity: .map)
        publisher.makeRequest(request: request)
    }

    // MARK: CONNECTION SUBSCRIBING METHODS
    
    func didGetmap(_ notification: Notification) {
        print("MapServices did receive ConnectionDidGetmap event")
        
        // get response attached to notification
        let res = notification.userInfo!["data"] as! Response
        let response = GetMapResponse(response: res)
        
        // post map from response to Map component
        publisher.didGetMap(map: response.getMap())
    }
}
