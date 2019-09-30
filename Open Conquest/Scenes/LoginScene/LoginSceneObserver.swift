//
//  LoginSceneObserver.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class LoginSceneObserver: Observer {
    
    override init() {
        super.init()
    }
    
    // observing notifications originating from game
    func setupObservers(scene: LoginScene) {
        observe(observingFunction: scene.userDidLoginSuccessfully(_:), name: .GameLoginSuccess)
    }
}
