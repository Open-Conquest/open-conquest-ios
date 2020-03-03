//
//  RegisterRequest.swift
//  Open Conquest
//
//  Created by Zach Wild on 2/28/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class RegisterRequest: Request {
    
    init(gameTryRegisterData: GameTryRegisterData) {
        let data = JSON([
            "username": gameTryRegisterData.username,
            "password": gameTryRegisterData.password
        ])
        super.init(service: APIServices.User, operation: APIOperations.RegisterUser, data: data)
    }

    init(username: String, password: String) {
        let data = JSON([
            "username": username,
            "password": password
        ])
        super.init(service: APIServices.User, operation: APIOperations.RegisterUser, data: data)
    }
}
