//
//  CityComponent.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/15/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class CityComponent: GameComponent {
    var cities: [City]?
    let subscriber: Subscriber
    let publisher: CityComponentPublisher
    
    init() {
        subscriber = Subscriber()
        publisher = CityComponentPublisher()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        
        subscriber.subscribe(observingFunction: tryGetCities(_:), name: .SceneTryGetCities)
        
        subscriber.subscribe(observingFunction: didGetCities(_:), name: .APIDidGetCities)
    }
    
    // MARK: SCENE SUBSCRIBING METHODS
    
    func tryGetCities(_ notification: Notification) {
        print("CityComponent recieved scene-try-get-cities event...")
        
        // if cities are already stored, send those cities to scene
        if (cities != nil) {
            publisher.didGetCities(cities: cities!)
        }
        // if cities aren't already stored, call api to get cities
        else {
            publisher.tryGetCities()
        }
    }
    
    // MARK: API SUBSCRIBING METHODS
    
    func update(notification: Notification) {
        /*
            long comment about how this should be implemented
            you need to implement this because i said so..
            might change in the future but for now it seems like a good idea
        */
        
    }
    
    func didGetCities(_ notification: Notification) {
        print("CityComponent recieve APIDidGetCities event")
        /*
            not concered with specific cities being returned,
            this assumes that ALL cities in the world are being received
         
            TOOO in the future... in a different method and api endpoint??
            maybe not different endpoint but need to enable queries.. to figure
            out at a later date, but don't forget about it! so here ya go now you
            won't forget because this comment should really stick out.
            - baby farts mcgee-zaks
        */
        
        // parse notification user data for cities
        cities = notification.userInfo!["data"] as? [City]
        
        // publish cities to scene
        publisher.didGetCities(cities: cities!)
    }
}
