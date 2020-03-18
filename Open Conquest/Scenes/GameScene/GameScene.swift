//
//  GameScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, Scene {
    let publisher: GameScenePublisher
    let subscriber: Subscriber
    
    var map: MapNode
    var overlay: MapOverlayView
    var marchSelectorView: MarchSelectorView
    
    var gestures: GameSceneGestures
    // keeps track of which tile is selected
    var rowSelected: Int?
    var colSelected: Int?
    
    override init(size: CGSize) {
        publisher = GameScenePublisher()
        subscriber = Subscriber()
        map = MapNode(map: Map())
        overlay = MapOverlayView()
        marchSelectorView = MarchSelectorView(frame: .zero)
        gestures = GameSceneGestures()
        super.init(size: size)
    }
    
    init(world: World) {
        publisher = GameScenePublisher()
        subscriber = Subscriber()
        map = MapNode(map: world.map)
        overlay = MapOverlayView()
        marchSelectorView = MarchSelectorView(frame: .zero)
        gestures = GameSceneGestures()
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setupUI()
        setupGestures()
        setupSubscribers()
        tryGetWorld()
    }
    
    override func update(_ currentTime: TimeInterval) {
        map.updateMarches()
    }
    
    // MARK: SETUP METHODS
    
    func setupUI() {
        // setup map & camera
        self.addChild(map)
        let camera = SKCameraNode()
        self.camera = camera
        map.addChild(camera)
        self.camera!.position = map.centerOfTile(atColumn: 0, row: 0)
        let zoomAction = SKAction.scale(by: 1000, duration: 0)
        self.camera!.run(zoomAction)
        
        // setup overlay
        view!.addSubview(overlay)
        overlay.setup()
        
        // setup march selector view
        view!.addSubview(marchSelectorView)
        marchSelectorView.autoPinEdge(.left, to: .left, of: view!)
        marchSelectorView.autoPinEdge(.right, to: .right, of: view!)
        marchSelectorView.autoPinEdge(.top, to: .top, of: view!)
        marchSelectorView.autoPinEdge(.bottom, to: .bottom, of: view!)
        marchSelectorView.autoPinEdgesToSuperviewMargins()
    }
    
    func setupGestures() {
        gestures = GameSceneGestures()
        
        // setup pan gesture
        let panSelector = #selector(self.handlePan(panGesture:))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: panSelector)
        view!.addGestureRecognizer(panGestureRecognizer)
        
        // setup pinch gesture
        let pinchGesture = #selector(self.handlePinch(pinchGesture:))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: pinchGesture)
        view!.addGestureRecognizer(pinchGestureRecognizer)
        
        // setup tap gesture
        let tapSelector = #selector(self.handleTap(tapGesture:))
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapSelector)
        tapGestureRecognizer.numberOfTapsRequired = 1
        view!.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupUIActions() {
        fatalError("no implementation")
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: didGetWorld(_:), name: .GameDidGetWorld)
    }
    
    // MARK: CLEANUP METHODS
    
    func prepareForNavigation() {
        // todo
    }
    
    func teardownSubscribers() {
        // todo
    }
    
    // MARK: SUBSCRIBING METHODS
    
    func didGetWorld(_ notification: Notification) {
        print("GameScene received game-did-get-world notification")
        
        let world = notification.userInfo!["world"] as! World
        
        map.drawMapFromMapModel(map: world.map)
    }
    
    // MARK: PUBLISHING METHODS
    
    func tryGetWorld() {
        publisher.tryGetWorld()
    }
    
    // MARK: GESTURING METHODS

    @objc func handlePan(panGesture: UIPanGestureRecognizer) {
        gestures.handlePan(panGesture: panGesture, scene: self, camera: camera!)
        map.hideButtons()
    }

    @objc func handlePinch(pinchGesture: UIPinchGestureRecognizer) {
        gestures.handlePinch(pinchGesture: pinchGesture, camera: camera!)
        map.hideButtons()
    }

    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
        
        print(map.numberOfRows)
        print(map.numberOfColumns)
        
        // get the location of the tap in skview
        let tapLocation = tapGesture.location(in: tapGesture.view)
        let location = self.convertPoint(fromView: tapLocation)
        
        // determine what node was tapped
        let node = self.atPoint(location)
        
        switch node.name {
        
        case GameSceneNodeNames.attackCityButton.rawValue:
            print("attack city button pressed")
            map.hideButtons()
            marchSelectorView.show()
        
        case GameSceneNodeNames.viewCityButton.rawValue:
            print("view city button pressed")
        
        case GameSceneNodeNames.messageCityButton.rawValue:
            print("message city button pressed")
            
        case GameSceneNodeNames.map.rawValue:
            print("map pressed")
            colSelected = map.tileColumnIndex(fromPosition: location)
            rowSelected = map.tileRowIndex(fromPosition: location)
            map.repositionButtons(location: location)
        
        default:
            print("Node with name \(String(describing: node.name)) pressed but doesn't have any action")
        }
    }
}
