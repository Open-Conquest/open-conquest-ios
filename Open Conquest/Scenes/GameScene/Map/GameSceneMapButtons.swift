//
//  GameSceneMapButtons.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SpriteKit

enum GameSceneButtonTypeEnum {
    case attack
    case view
    case message
}

enum GameSceneButtonNames: String {
    case attack = "attack-city-button"
    case view = "view-city-button"
    case message = "message-city-button"
}

class GameSceneMapButton: SKSpriteNode {
    init(buttonType: GameSceneButtonTypeEnum) {
        var texture: SKTexture?
        switch buttonType {
        case .attack:
            texture = SKTexture(imageNamed: "attack-city-button")
        case .view:
            texture = SKTexture(imageNamed: "view-city-button")
        case .message:
            texture = SKTexture(imageNamed: "message-city-button")
        }
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: 64, height: 64))
        
        // set initial properties
        zPosition = 1
        isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MessageCityButton: GameSceneMapButton {
    init() {
        super.init(buttonType: .message)
        
        // name property is the only unique identifier used to determine which button is pressed
        name = GameSceneButtonNames.message.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AttackCityButton: GameSceneMapButton {
    init() {
        super.init(buttonType: .attack)
        
        name = GameSceneButtonNames.attack.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewCityButton: GameSceneMapButton {
    init() {
        super.init(buttonType: .view)
        
        name = GameSceneButtonNames.view.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


