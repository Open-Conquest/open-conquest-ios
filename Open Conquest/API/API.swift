//
//  API.swift
//  Open Conquest
//
//  Created by Zach Wild on 6/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class API {
//    var connection: Connection
    var subscriber: Subscriber
    var publisher: APIPublisher
    var armyServices: ArmyServices
    var cityServices: CityServices
    var mapServices: MapServices
    var marchServices: MarchServices
    var userServices: UserServices
    var playerServices: PlayerServices
    
    init() {
        print("API initializing...")
        subscriber = Subscriber()
        publisher = APIPublisher()
        
        armyServices = ArmyServices()
        cityServices = CityServices()
        mapServices = MapServices()
        marchServices = MarchServices()
        userServices = UserServices()
        playerServices = PlayerServices()
        print("API initialized.")
    }
}
