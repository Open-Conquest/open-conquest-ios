//
//  ArmyService.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/15/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class ArmyService: GameService {
    var armies:     [Army]?
    
    // core data
    let context: NSManagedObjectContext
//    let army: CDArmy
    
    var publisher:  ArmyServicePublisher
    var subscriber: Subscriber
    
    init(context: NSManagedObjectContext) {
        
        // initialize core data context
        self.context = context
        
        self.publisher  = ArmyServicePublisher()
        self.subscriber = Subscriber()
        setupSubscribers()
    }
    
    func setupSubscribers() {
    }
    
    // MARK: SCENE SUBSCRIBING METHODS
    
//    func tryGetArmies(_ notification: Notification) {
//        print("ArmyService received SceneTryGetArmies event")
//
//        // if armies have already been loaded
//        if (armies != nil) {
//            // send those armies to the scene
//            publisher.didGetArmies(armies: armies!)
//        }
//        // if armies have not been loaded
//        else {
//            // make api request to get armies
//            publisher.tryGetArmies()
//        }
//
//    }
    
    // MARK: API SUBSCRIBING METHODS
    
    func update(notification: Notification) {
        /*
            long comment about how this should be implemented
            you need to implement this because i said so..
            might change in the future but for now it seems like a good idea
        */
        
    }
    
//    func didGetArmies(_ notification: Notification) {
//        print("ArmyService received APIDidGetArmies event.")
//
//        // get armies from notification
//        armies = notification.userInfo!["data"] as? [Army]
//
//        // save armies from notification
//
//
//        // send armies array to scene
//        publisher.didGetArmies(armies: armies!)
//    }
}

