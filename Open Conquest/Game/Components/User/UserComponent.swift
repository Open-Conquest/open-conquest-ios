//
//  User.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserComponent {
    
    var userService: UserServices
    
    init() {
        userService = UserServices()
    }
    
    func tryLogin(username: String, password: String) -> Bool {
        print("UserComponent login")
        return userService.login(username: username, password: password)
    }
}

