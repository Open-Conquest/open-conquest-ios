//
//  Observer.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class Observer {
    
    init() {
        
    }
    
    func observe(observingFunction: @escaping (Notification) -> Void, name: Notification.Name) {
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: observingFunction)
    }
}
