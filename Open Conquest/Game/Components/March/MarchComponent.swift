//
//  MarchComponent.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MarchComponent: GameComponent {
    var marches: [March]?
    let publisher: MarchComponentPublisher
    let subscriber: Subscriber
    
    init() {
        publisher = MarchComponentPublisher()
        subscriber = Subscriber()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: tryGetMarches(_:), name: .SceneTryGetMarches)
        subscriber.subscribe(observingFunction: didGetMarches(_:), name: .APIDidGetMarches)
    }
    
    func update(notification: Notification) {
        fatalError("not implemented")
    }
    
    // MARK: METHODS SUBSCRIBED TO SCENE NOTIFICATIONS
    
    func tryGetMarches(_ notification: Notification) {
        print("MarchComponent recieved scene-try-get-marches event...")
        
        if (marches != nil) {
            publisher.didGetMarches(marches: marches!)
        }
        else {
            publisher.tryGetMarches()
        }
    }
    
    // MARK: METHODS SUBSCRIBED TO API NOTIFICATIONS
    
    func didGetMarches(_ notification: Notification) {
        print("MarchComponent recieved api-did-get-marches event...")
        
        marches = notification.userInfo!["data"] as? [March]
        publisher.didGetMarches(marches: marches!)
    }

}