//
//  MarchNode.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/23/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SpriteKit

class MarchNode: SKSpriteNode {
    
    var march: March
    // details for movement in the map space
    var startPoint: CGPoint
    var endPoint: CGPoint
    var xSlope: CGFloat
    var ySlope: CGFloat
    var isReturning: Bool
    
    init(march: March, startPoint: CGPoint, endPoint: CGPoint) {
        self.march = march
        
        // determine if march has already reached its destination
        let secondsElapsed = Date().timeIntervalSince(march.start_time)
        if (secondsElapsed > (march.total_time / 2)) {
            // reverse starting point & end point to satisfy movement algorithm
            let tempPoint = startPoint
            self.startPoint = endPoint
            self.endPoint = tempPoint
            isReturning = true
        } else {
            self.startPoint = startPoint
            self.endPoint = endPoint
            isReturning = false
        }
        
        // calculate slope for march (depends on time passed since the start)
        self.xSlope = ((self.endPoint.x - self.startPoint.x) / CGFloat(march.total_time / 2)) * CGFloat(march.speed_modifier)
        self.ySlope = ((self.endPoint.y - self.startPoint.y) / CGFloat(march.total_time / 2)) * CGFloat(march.speed_modifier)
        
        let texture = SKTexture(imageNamed: "horse_1")
        super.init(texture: texture, color: UIColor.white, size: CGSize(width: 80, height: 80))
    }
    
    func update() {
        // number of seconds passed since the start of the march
        let secondsElapsed = Date().timeIntervalSince(march.start_time)
        
        // if march reached its destination (half of all time has passed), then turn around and reverse slope
        if ((secondsElapsed > (march.total_time / 2)) && !isReturning) {
            isReturning = true
            
            // reverse starting point & end point to satisfy movement algorithm
            let tempPoint = startPoint
            startPoint = endPoint
            endPoint = tempPoint

            xSlope = ((endPoint.x - startPoint.x) / CGFloat(march.total_time / 2)) * CGFloat(march.speed_modifier)
            ySlope = ((endPoint.y - startPoint.y) / CGFloat(march.total_time / 2)) * CGFloat(march.speed_modifier)
        }
        
        // if march is over remove itself from super node
        if (secondsElapsed > march.total_time) {
            self.removeFromParent()
        }
        
        if (isReturning) {
            // move march by x,y slope * number of seconds that passed since switching directions
            // number of seconds that passed since switching directions is seconds since start - total_time / 2
            position.x = startPoint.x + (xSlope * CGFloat(secondsElapsed - (march.total_time / 2)))
            position.y = startPoint.y + (ySlope * CGFloat(secondsElapsed - (march.total_time / 2)))
        } else {
            // move march by x,y slope * number of seconds that passed since the start of the march
            position.x = startPoint.x + (xSlope * CGFloat(secondsElapsed))
            position.y = startPoint.y + (ySlope * CGFloat(secondsElapsed))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
