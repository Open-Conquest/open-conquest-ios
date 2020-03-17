//
//  CityServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/17/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class CityServices {
    var publisher:  CityServicesPublisher
    var subscriber: Subscriber
    
    init() {
        publisher = CityServicesPublisher()
        subscriber = Subscriber()
        
        setupSubscribers()
    }
    
    func setupSubscribers() {
//        
//        subscriber.subscribe(observingFunction: tryGetCities(_:), name: .GameTryGetCities)
//        
//        subscriber.subscribe(observingFunction: didGetCities(_:), name: .ConnectionDidGetCities)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    func tryGetCities(_ notification: Notification) {
        print("CityService did recieve GameTryGetCities event")
        
        let request = GetEntityRequest(entity: .city)
        publisher.makeRequest(request: request)
    }

    // MARK: CONNECTION SUBSCRIBING METHODS
    
    func didGetCities(_ notification: Notification) {
        print("CityServices did receive ConnectionDidGetCities event")
        
        // get response attached to notification
        let res = notification.userInfo!["data"] as! Response
        let response = GetCitiesResponse(response: res)
        
        // post cities from response to city component
        publisher.didGetCities(cities: response.getCities())
    }
}
