//
//  File.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class Poster {
    
    init() {
        
    }
    
    func post(notification: Notification) {
        NotificationCenter.default.post(notification)
    }
}
