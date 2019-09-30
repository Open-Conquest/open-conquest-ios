//
//  GameAPI.swift
//  Open Conquest
//
//  Created by Zach Wild on 6/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class API
{
    
    var connection: ConnectionManager
    
    init()
    {
        // connection to server should be made
        connection = ConnectionManager()
        
        connection.send(message: "created connection")
    }
    
    
    
    // api has a connection to the api
    // -- make requests to the api and returns the responses
    
   
}
