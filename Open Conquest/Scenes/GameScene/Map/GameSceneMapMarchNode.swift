//
//  GameSceneMapMarchNode.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/23/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SpriteKit

class GameSceneMapMarchNode: SKSpriteNode {
    
    var march: March
    // details for movement in the map space
    var startPos: CGPoint = CGPoint(x: 0, y: 0)
    var endPos: CGPoint = CGPoint(x: 0, y: 0)
    var xSlope: CGFloat = 0
    var ySlope: CGFloat = 0
    var endTime: Date = Date()
    
    init(march: March) {
        self.march = march
        
        // todo: replace with real march texture or something
        let texture = SKTexture(imageNamed: "horse_1")
        super.init(texture: texture, color: UIColor.white, size: CGSize(width: 80, height: 80))
    }
    
    func update() {
        self.xSlope = endPos.x - startPos.x
        self.ySlope = endPos.y - startPos.y
        self.xSlope = self.xSlope / 10000
        self.ySlope = self.ySlope / 10000

        // move march along towards the end
        position.x += xSlope
        position.y += ySlope
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
