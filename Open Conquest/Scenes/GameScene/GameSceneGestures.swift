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

class GameSceneGestures
{
    
    var scene: GameScene
    var camera: SKCameraNode
    
    var startingPoint: CGPoint
    var currentPoint: CGPoint
    
    init(scene: GameScene, camera: SKCameraNode)
    {
        self.scene = scene
        self.camera = camera
        startingPoint = CGPoint(x: 0, y: 0)
        currentPoint = CGPoint(x: 0, y: 0)
    }
    
    @objc func handlePan(panGesture: UIPanGestureRecognizer)
    {
        if panGesture.state == .began
        {
            startingPoint = panGesture.location(in: scene.view)
        }
        else if panGesture.state == .changed
        {
            currentPoint = panGesture.location(in: scene.view)
            let xDiff = currentPoint.x - startingPoint.x
            let yDiff = currentPoint.y - startingPoint.y
            
            let currPos = camera.position
            let newPos = CGPoint(x: currPos.x - xDiff,
                                 y: currPos.y + yDiff)
            
            self.camera.position = newPos
            
            startingPoint = currentPoint
        }
        else if panGesture.state == .ended
        {
            currentPoint = panGesture.location(in: scene.view)
        }
    }
    
}


