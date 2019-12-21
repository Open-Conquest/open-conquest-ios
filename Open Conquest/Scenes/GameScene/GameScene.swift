//
//  GameScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, Scene {
    
    var map: GameSceneMapNode?
    var overlay: GameSceneOverlayView?
    var gestures: GameSceneGestures?
    var mapCamera: SKCameraNode?
    let publisher: GameScenePublisher
    let subscriber: Subscriber
    
    override init() {
        publisher = GameScenePublisher()
        subscriber = Subscriber()
        super.init()
    }
    
    override init(size: CGSize) {
        publisher = GameScenePublisher()
        subscriber = Subscriber()
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        print("DidMoveTo GameScene")
        // setup map (with model)
        setupMap()
        setupOverlay()
        setupGestures()
        setupSubscribers()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // draw once they move
    }
    // MARK: SETUP METHODS
    
    func setupSubscribers() {
        // subscribe to update methods
    }

    func setupUI() {
        //asdf
    }
    
    func setupUIActions() {
        //t
    }
    
    func prepareForNavigation() {
        // todo
    }
    
    func teardownSubscribers() {
        // todo
    }
    
    func setupGestures() {
        gestures = GameSceneGestures(scene: self, camera: mapCamera!)
        // setup pan gesture
        let panSelector = #selector(self.handlePan(panGesture:))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
        self.view?.addGestureRecognizer(panGestureRecognizer)
    }
    
    func setupOverlay() {
        
    }
    
    func setupMap() {
        map = GameSceneMapNode(map: Map())
        mapCamera = SKCameraNode()
        camera = mapCamera!
        addChild(map!)
        map?.addChild(mapCamera!)
    }
    
    // MARK: UI GESTURE METHODS
    
    @objc func handlePan(panGesture: UIPanGestureRecognizer) {
       gestures!.handlePan(panGesture: panGesture)
    }
    
    // MARK: OBSERVING METHODS
    
    func updateMap(_ notification: Notification) {
        // updates a single tile when a change event is recieved
        map!.updateTile()
    }
    
    
}
