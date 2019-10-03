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
    var data:       JSON
    
    init(service: String, operation: String, data: JSON) {
        self.service    = APIServices(rawValue: service)!
        self.operation  = APIOperations(rawValue: operation)!
        self.data       = data
    }
    
    init(data: [AnyHashable: Any]) {
        fatalError("No implementation")
    }
    
    func toString() -> String {
        let request = JSON([
            "service": service.rawValue,
            "operation": operation.rawValue,
            "data": data
        ])
        return request.rawString()!
    }
}
