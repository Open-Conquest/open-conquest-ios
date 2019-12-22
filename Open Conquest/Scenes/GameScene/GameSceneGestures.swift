//
//  GameSceneGestures.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GameSceneGestures {
    
    var startingPoint: CGPoint
    var currentPoint: CGPoint
    
    init() {
        startingPoint = CGPoint(x: 0, y: 0)
        currentPoint = CGPoint(x: 0, y: 0)
    }
    
    @objc func handlePan(panGesture: UIPanGestureRecognizer, scene: GameScene, camera: SKCameraNode) {
        if panGesture.state == .began {
            startingPoint = panGesture.location(in: scene.view)
        }
        else if panGesture.state == .changed {
            currentPoint = panGesture.location(in: scene.view)
            let xDiff = currentPoint.x - startingPoint.x
            let yDiff = currentPoint.y - startingPoint.y
            
            let currPos = camera.position
            let newPos = CGPoint(x: currPos.x - xDiff,
                                 y: currPos.y + yDiff)
            
            camera.position = newPos
            
            startingPoint = currentPoint
        }
        else if panGesture.state == .ended {
            currentPoint = panGesture.location(in: scene.view)
        }
    }
    
    /*
     Handle pinch gestures. This allows players to zoom in and out of the map.
    */
    @objc func handlePinch(pinchGesture: UIPinchGestureRecognizer, camera: SKCameraNode) {
        if pinchGesture.state == .began || pinchGesture.state == .changed {

            let zoomAction = SKAction.scale(by: 1/pinchGesture.scale, duration: 0)
            if (camera.yScale > CGFloat(0.3) || 1/pinchGesture.scale > 1) {
                camera.run(zoomAction)
            }

            pinchGesture.scale = 1.0
        }
    }
}


