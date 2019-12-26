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
    let startPoint: CGPoint
    let endPoint: CGPoint
    var xSlope: CGFloat
    var ySlope: CGFloat
    
    init(march: March, startPoint: CGPoint, endPoint: CGPoint) {
        self.march = march
        // calculate slope for march
        self.xSlope = ((endPoint.x - startPoint.x) / CGFloat(march.total_time)) * CGFloat(march.speed_modifier)
        self.ySlope = ((endPoint.y - startPoint.y) / CGFloat(march.total_time)) * CGFloat(march.speed_modifier)
        // set starting & ending position in map node's coordinates
        self.startPoint = startPoint
        self.endPoint = endPoint
        
        let texture = SKTexture(imageNamed: "horse_1")
        super.init(texture: texture, color: UIColor.white, size: CGSize(width: 80, height: 80))
    }
    
    func update() {
        // number of seconds passed since the start of the march
        let secondsElapsed = Date().timeIntervalSince(march.start_time)
        
        // move march by x,y slope * number of seconds that passed since the start of the march
        position.x = startPoint.x + (xSlope * CGFloat(secondsElapsed))
        position.y = startPoint.y + (ySlope * CGFloat(secondsElapsed))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
