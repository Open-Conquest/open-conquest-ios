//
//  LoginResponse.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/7/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginUserResponseDTO: Response {
    let token: Token
    let username: String

    init(response: Response) {
        let responseData = response.getData()
        username = responseData["username"].string!
        token = Token(value: responseData["token"]["value"].string!)
        super.init(service: .User, operation: .LoginUser, data: response.getData())
    }
    
    func getUsername() -> String {
        return username
    }
    
    func getToken() -> Token {
        return token
    }
}
