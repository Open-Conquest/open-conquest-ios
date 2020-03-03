//
//  APIRegisterSucceedData.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class APIRegisterSucceedData {
    var username: String
    var token: Token
    
    init(username: String, token: Token) {
        self.username = username
        self.token = token
    }
    
    func getUsername() -> String {
        return username
    }
    
    func getToken() -> Token {
        return self.token
    }
}
