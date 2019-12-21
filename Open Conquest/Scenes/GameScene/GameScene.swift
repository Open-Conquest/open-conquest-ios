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
        setupUI()
        setupUIActions()
        setupMap()
        setupOverlay()
        setupGestures()
        setupSubscribers()
        loadComponentsIntialState()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // draw once they move
    }
    // MARK: SETUP METHODS
    
    func setupUI() {
        setupMap()
        setupOverlay()
    }
    
    func setupMap() {
        print("GameScene setting up map")
        
        // initialize map & add to scene
        map = GameSceneMapNode(map: Map())
        self.addChild(map!)
        
        // intialize camera & add to map
        let camera = SKCameraNode()
        self.camera = camera
        map!.addChild(camera)
    }
    
    func setupOverlay() {
        // todo
    }
    
    func setupUIActions() {
        // todo
    }
    
    func setupGestures() {
        gestures = GameSceneGestures(scene: self, camera: camera!)
        // setup pan gesture
        let panSelector = #selector(self.handlePan(panGesture:))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
        self.view?.addGestureRecognizer(panGestureRecognizer)
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: didGetCities(_:), name: .GameDidGetCities)
        subscriber.subscribe(observingFunction: didGetMap(_:), name: .GameDidGetMap)
        subscriber.subscribe(observingFunction: didGetMarches(_:), name: .GameDidGetMarches)
    }
    
    func loadComponentsIntialState() {
        publisher.getCities()
        publisher.getMap()
        publisher.getMarches()
    }
    
    // MARK: CLEANUP METHODS
    
    func prepareForNavigation() {
        // todo
    }
    
    func teardownSubscribers() {
        // todo
    }
    
    // MARK: SUBSCRIBING METHODS
    
    func didGetCities(_ notifiction: Notification) {
        print("GameScene recieved scene-did-get-cities event...")
        // todo
    }
    
    func didGetMap(_ notification: Notification) {
        print("GameScene recieved scene-did-get-map event...")
        
        // pull map model from notification
        let mapModel = notification.userInfo!["data"] as! [Map]
        
        // draw map from map model
        map!.drawMapFromMapModel(map: mapModel[0])
        
        // move camera to focus on map
        camera!.position = map!.centerOfTile(atColumn: 0, row: 0)
        let zoomAction = SKAction.scale(by: 1000, duration: 0)
        camera!.run(zoomAction)
    }
    
    func didGetMarches(_ notification: Notification) {
        // todo
        print("GameScene recieved scene-did-get-marches event...")
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
