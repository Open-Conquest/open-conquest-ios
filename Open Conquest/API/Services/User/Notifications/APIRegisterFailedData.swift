//
//  APIRegisterFailedData.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class APIRegisterFailedData {
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    func getMessage() -> String {
        return message
    }
}
