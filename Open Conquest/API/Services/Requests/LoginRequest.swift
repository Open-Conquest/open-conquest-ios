//
//  LoginRequest.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/3/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginRequest: Request {
    
    init(gameTryLoginData: GameTryLoginData) {
        let data = JSON([
            "username": gameTryLoginData.username,
            "password": gameTryLoginData.password
        ])
        super.init(service: "user", operation: "login", data: data)
    }

    init(username: String, password: String) {
        let data = JSON(["username": username,
                         "password": password])
        super.init(service: "user", operation: "login", data: data)
    }
}
