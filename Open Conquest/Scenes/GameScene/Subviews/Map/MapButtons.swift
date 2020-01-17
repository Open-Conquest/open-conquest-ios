//
//  MapButtons.swift
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

class MapButton: SKSpriteNode {
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

class MessageCityButton: MapButton {
    init() {
        super.init(buttonType: .message)
        
        // name property is the only unique identifier used to determine which button is pressed
        name = GameSceneNodeNames.messageCityButton.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AttackCityButton: MapButton {
    init() {
        super.init(buttonType: .attack)
        
        name = GameSceneNodeNames.attackCityButton.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewCityButton: MapButton {
    init() {
        super.init(buttonType: .view)
        
        name = GameSceneNodeNames.viewCityButton.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


