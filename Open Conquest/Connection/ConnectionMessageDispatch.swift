//
//  ConnectionMessageDispatch.swift
//  Open Conquest
//
//  The message dispatch is responsible for handling an incoming request
//  and deciding which notification to publish.
//
//  Created by Zach Wild on 11/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class ConnectionMessageDispatch {
    
    var publisher: ConnectionPublisher
    
    init() {
        publisher = ConnectionPublisher()
    }
    
    func handle(json: JSON) {
        let response = Response(body: json)
        let service = response.getService()
        print("ConnectionMessageDispatch received response: \(response.toString())")
        
        switch service {
        case APIServices.User:
            publisher.publishUserResponse(response: response)
        case APIServices.Player:
            publisher.publishPlayerResponse(response: response)
        case APIServices.World:
            publisher.publishWorldResponse(response: response)
        default:
            print("Unexpected response from Connection: \(response.toString())")
        }
    }
}
