//
//  WorldServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class WorldServices: BaseAPIServices {
    var publisher: WorldServicesPublisher
    var subscriber: Subscriber
    
    override init() {
        publisher = WorldServicesPublisher()
        subscriber = Subscriber()
        super.init()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: tryGetWorld(_:), name: .GameTryGetWorld)
        subscriber.subscribe(observingFunction: didGetWorld(_:), name: .ConnectionDidGetWorld)
        subscriber.subscribe(observingFunction: didGetWorldFailed(_:), name: .ConnectionDidGetWorldFailed)
    }
    
    func tryGetWorld(_ notification: Notification) {
        print("WorldService received GameTryGetWorld event")
        let token = Token(value: getTokenFromKeychain())
        let request = GetWorldRequestDTO(token: token)
        publisher.tryGetWorld(request: request)
    }
    
    func didGetWorld(_ notification: Notification) {
        print("WorldService received ConnectionDidGetWorld event")
        
        // convert response to DTO
        let getWorldResponse = GetWorldResponseDTO(response:
            notification.userInfo!["data"] as! Response
        )
        
        // get world entity from response
        let world = getWorldResponse.getWorld().toEntity()
        
        // post world in notification
        publisher.didGetWorld(world: world)
    }
    
    func didGetWorldFailed(_ notification: Notification) {
        print("WorldService received ConnectionDidGetWorldFailed event")
        
        // really just get error message? this is fucked shouldn't really happen
    }
    
}
