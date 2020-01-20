//
//  MarchService.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MarchService: GameService {
    var marches: [March]?
    let publisher: MarchServicePublisher
    let subscriber: Subscriber
    
    init() {
        publisher = MarchServicePublisher()
        subscriber = Subscriber()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: tryGetMarches(_:), name: .SceneTryGetMarches)
        subscriber.subscribe(observingFunction: didGetMarches(_:), name: .APIDidGetMarches)
        //subscriber.subscribe(observingFunction: tryCreateMarch(_:), name: .SceneTryCreateMarch)
    }
    
    func update(notification: Notification) {
        fatalError("not implemented")
    }
    
    // MARK: METHODS SUBSCRIBED TO SCENE NOTIFICATIONS
    
    func tryGetMarches(_ notification: Notification) {
        print("MarchService recieved scene-try-get-marches event...")
        
        if (marches != nil) {
            publisher.didGetMarches(marches: marches!)
        }
        else {
            publisher.tryGetMarches()
        }
    }
    
    func tryCreateMarch(_ notification: Notification) {
        print("MarchService recieved scene-try-create-march event...")
        
        
    }
    
    // MARK: METHODS SUBSCRIBED TO API NOTIFICATIONS
    
    func didGetMarches(_ notification: Notification) {
        print("MarchService recieved api-did-get-marches event...")
        
        marches = notification.userInfo!["data"] as? [March]
        publisher.didGetMarches(marches: marches!)
    }

}
