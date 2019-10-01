//
//  UserService.swift
//  Open Conquest
//
//  Created by Zach Wild on 9/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserServices {
    
    var publisher: UserServicesPublisher
    
    init() {
        publisher = UserServicesPublisher()
    }
    
    func setupObservers() {
//        NotificationCenter.default.addObserver(forName: .SceneTryLogin, object: nil, queue: nil, using: login(_:))
    }
    
    func login(username: String, password: String) -> Bool {
        print("UserServices login")
        // make request to server to login
        return true
    }
    
}
