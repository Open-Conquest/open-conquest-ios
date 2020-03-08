//
//  Request.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/3/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class Request {
    var service:    APIServices
    var operation:  APIOperations
    var token:      Token?
    var data:       JSON
    
    init(service: APIServices, operation: APIOperations, data: JSON) {
        self.service = service
        self.operation = operation
        self.data = data
    }
    
    init(service: APIServices, operation: APIOperations, token: Token, data: JSON) {
        self.service = service
        self.operation = operation
        self.token = token
        self.data = data
    }
    
    init(service: String, operation: String, data: JSON) {
        self.service    = APIServices(rawValue: service)!
        self.operation  = APIOperations(rawValue: operation)!
        self.data       = data
    }
    
    init(data: [AnyHashable: Any]) {
        fatalError("No implementation")
    }
    
    func setToken(token: Token) {
        self.token = token
    }
    
    func toString() -> String {
        var request: JSON
        if let tokenVal = token?.getValue() {
            request = JSON([
                "service": service.rawValue,
                "operation": operation.rawValue,
                "token": ["value": tokenVal],
                "data": data
            ])
        } else {
            request = JSON([
                "service": service.rawValue,
                "operation": operation.rawValue,
                "token": token?.getValue(),
                "data": data
            ])
        }
        return request.rawString()!
    }
}
