//
//  APILoginSucceedData.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class APILoginSucceedData {
    let username: String
    init(username: String) {
        self.username = username
    }
    func getUsername() -> String {
        return username
    }
}
