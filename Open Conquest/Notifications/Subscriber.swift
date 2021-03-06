//
//  Observer.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class Subscriber {
    
    init() {}
    
    func subscribe(observingFunction: @escaping (Notification) -> Void, name: Notification.Name) {
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: observingFunction)
    }
    
    func unsubscribe(observingFunction: @escaping (Notification) -> Void) {
        NotificationCenter.default.removeObserver(observingFunction)
    }
}

protocol SubscriberProtocol {
    func setupSubscribers()
}
