//
//  GameComponent.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

protocol GameComponent {
    func update(notification: Notification)
    func setupSubscribers()
}

protocol GameComponentController {
    func update(notification: Notification)
    func setupSubscribers()
}
