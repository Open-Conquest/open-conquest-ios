//
//  User.swift
//  Open Conquest
//
//  Created by zach on 6/3/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class User
{
    var id: Int?
    var username: String?
    var isLoggedIn: Bool
    
    init()
    {
        self.isLoggedIn = false
    }
    
    init(id: Int, username: String)
    {
        self.id = id
        self.username = username
        self.isLoggedIn = true
    }
}
