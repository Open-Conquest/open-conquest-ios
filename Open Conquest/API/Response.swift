//
//  Response.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/3/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class Response {
    
    var service:    APIServices
    var operation:  APIOperations
    var data:       JSON
    
    init(service: String, operation: String, data: JSON) {
        self.service    = APIServices(rawValue: service)!
        self.operation  = APIOperations(rawValue: operation)!
        self.data       = data
    }
    
    init(body: JSON) {
        self.service    = APIServices(rawValue: body["service"].string!)!
        self.operation  = APIOperations(rawValue: body["operation"].string!)!
        self.data       = body["data"]
    }
    
    init(data: [AnyHashable: Any]) {
        fatalError("No implementation")
    }
    
    func getService() -> APIServices {
        return service
    }
    
    func getOperation() -> APIOperations {
        return operation
    }
    
    func getData() -> JSON {
        return data
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
