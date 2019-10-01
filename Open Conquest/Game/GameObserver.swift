//
//  GameObserver.swift
//  Open Conquest
//
//  Created by zach on 6/4/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

protocol GameObserver {
    func setupObservers()
}

//class GameObserver: Observer {
//
//    // listens for notifications from the scene
//    override init() {
//        super.init()
//    }
//
//    func setupObservers(game: Game) {
//        // listen for notifications incoming from scene
//        observe(observingFunction: game.tryLogin(_:), name: .SceneTryLogin)
//    }
//
//    func teardownObservers() {
//
//    }
//
//}
