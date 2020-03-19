//
//  Observer.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class Subscriber {
    var observers = [NSObjectProtocol]()
    
    init() {}
    
    func subscribe(observingFunction: @escaping (Notification) -> Void, name: Notification.Name) {
        let observer = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: observingFunction)
        observers.append(observer)
    }
    
    func unsubscribe(observingFunction: @escaping (Notification) -> Void) {
        NotificationCenter.default.removeObserver(observingFunction)
    }
    
    func unsubscribeAllObservers() {
        for observer in observers {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}

protocol SubscriberProtocol {
    func setupSubscribers()
}
