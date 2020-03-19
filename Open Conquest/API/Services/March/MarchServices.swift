//
//  MarchServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MarchServices {
    var publisher:  MarchServicesPublisher
    var subscriber: Subscriber
    
    init() {
        publisher = MarchServicesPublisher()
        subscriber = Subscriber()
        
        setupSubscribers()
    }
    
    func setupSubscribers() {
        
//        subscriber.subscribe(observingFunction: tryGetMarch(_:), name: .GameTryGetMarches)
//        
//        subscriber.subscribe(observingFunction: didGetMarch(_:), name: .ConnectionDidGetMarches)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    func tryGetMarch(_ notification: Notification) {
        print("MarchService did recieve GameTryGetMarches event")
        
        let request = GetEntityRequest(entity: .march)
        publisher.makeRequest(request: request)
    }

    // MARK: CONNECTION SUBSCRIBING METHODS
    
    func didGetMarch(_ notification: Notification) {
        print("MarchServices did receive ConnectionDidGetMarches event")
        
        // get response attached to notification
        let res = notification.userInfo!["data"] as! Response
        let response = GetMarchesResponse(response: res)
        
        // post March from response to March component
        publisher.didGetMarches(marches: response.getMarches())
    }
}
