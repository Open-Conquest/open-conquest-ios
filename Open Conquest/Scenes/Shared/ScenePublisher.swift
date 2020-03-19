//
//  ScenePublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/21/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class ScenePublisher: Publisher {
    
    let sceneNotificationFactory: SceneNotificationFactory
    
    override init() {
        sceneNotificationFactory = SceneNotificationFactory()
    }
}
