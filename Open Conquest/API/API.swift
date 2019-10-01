//
//  GameAPI.swift
//  Open Conquest
//
//  Created by Zach Wild on 6/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class API {
    
    static let connection = WebSocketConnection()
    
    init() {}
    
    static func getInstance() -> WebSocketConnection {
        return API.connection
    }
}
