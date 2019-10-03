//
//  Scene.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/11/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SpriteKit

class Scene: SKScene {
    
//    weak var viewController: GameViewController?
//
//    init (size: CGSize, viewController: GameViewController) {
//        self.viewController = viewController
//        super.init(size: UIScreen.main.bounds.size)
//    }
    
    override init () {
        super.init(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        fatalError("Method must be overriden in subclass")
    }
    
    func setupUIActions() {
        fatalError("Method must be overriden in subclass")
    }
    
    func prepareForNavigation() {
        fatalError("Method must be overriden in subclass")
    }
    
    func setupSubscribers() {
        fatalError("Method must be overriden in subclass")
    }

    func teardownSubscribers() {
       fatalError("Method must be overriden in subclass")
    }
}
