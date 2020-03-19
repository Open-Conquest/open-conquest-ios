//
//  ArmyServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/28/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class ArmyServices {
    var publisher:  ArmyServicesPublisher
    var subscriber: Subscriber
    
    init() {
        publisher   = ArmyServicesPublisher()
        subscriber  = Subscriber()
        
        setupSubscibers()
    }
    
    func setupSubscibers() {
        // game subscribing methods
//        subscriber.subscribe(observingFunction: tryGetArmies(_:), name: .GameTryGetArmies)
        
        // connection subscribing methods
//        subscriber.subscribe(observingFunction: didGetArmies(_:), name: .ConnectionDidGetArmies)
    }
    
    func tryGetArmies(_ notification: Notification) {
        print("ArmyServices received GameTryGetArmies event.")
        
        let request = GetEntityRequest(entity: .army)
        publisher.makeRequest(request: request)
    }
    
    func didGetArmies(_ notification: Notification) {
        print("ArmyServices received ConnectionDidGetArmies event.")
        
        let response = notification.userInfo!["data"] as! Response
        let getArmiesResponse = GetArmiesResponse(response: response)
        publisher.didGetArmies(response: getArmiesResponse)
    }
}
