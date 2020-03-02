//
//  LoginResponse.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/7/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginUserReponse: Response {
    var token: Token?
    var username: String?
    
    init(response: Response) {
        
        // from json
        
        super.init(service: .User, operation: .LoginUser, data: JSON())
//        let data = JSON([
//            "username": gameTryLoginData.username,
//        ])
//        super.init(service: .user, operation: .LoginUser, data: data)
    }

    init(username: String, password: String) {
//        let data = JSON([
//            "username": username,
//            "password": password
//        ])
//        super.init(service: .user, operation: .LoginUser, data: data)
        super.init(service: .User, operation: .LoginUser, data: JSON())
    }
}
