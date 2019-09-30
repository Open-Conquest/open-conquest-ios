//
//  GameScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    var game:       Game
    var map:        GameSceneMap?
    var overlay:    GameSceneOverlay?
    var gestures:   GameSceneGestures?
    var mapCamera:  SKCameraNode?
    
    init(game: Game, size: CGSize)
    {
        self.game = game
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        // setup map (with model)
        map = GameSceneMap(map: game.getMap())
        mapCamera = SKCameraNode()
        camera = mapCamera!
        addChild(map!)
        map?.addChild(mapCamera!)
        // setup marches on map (with model)
        // setup overlay (with model)
        // setup all actions on map
        // setup all actions on overlay
        gestures = GameSceneGestures(scene: self, camera: mapCamera!)
        setupGestures()
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        // draw once they move
    }
    
    func setupGestures()
    {
        // setup pan gesture
        let panSelector = #selector(self.handlePan(panGesture:))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
        self.view?.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func handlePan(panGesture: UIPanGestureRecognizer)
    {
       gestures!.handlePan(panGesture: panGesture)
    }
    
}
