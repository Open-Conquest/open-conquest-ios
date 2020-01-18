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
    
    // MARK: SKNodes
    var map: MapNode?
    var marches = [MarchNode]()
    // tile buttons
    var messageCityButton: MessageCityButton?
    var viewCityButton: ViewCityButton?
    var attackCityButton: AttackCityButton?
    
    // MARK: UIViews
    var overlay: GameSceneOverlay?
    var marchSelectorView: MarchSelectorView?
    
    // encapsulates gesture handling logic
    var gestures: GameSceneGestures?
    
    // used to keep track of which tile is selected
    var rowSelected: Int?
    var colSelected: Int?
    
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
        setupGestures()
        setupSubscribers()
        
        loadComponentsIntialState()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        // update marches
        for march in marches {
            march.update()
        }
    }
    
    // MARK: SETUP METHODS
    
    func setupUI() {
        setupMap()
        setupMapButtons()
        setupOverlay()
        setupAttackCityView()
    }
    
    func setupMap() {
        map = MapNode(map: Map())
        self.addChild(map!)
        
        let camera = SKCameraNode()
        self.camera = camera
        map!.addChild(camera)
    }
    
    func setupMapButtons() {
        attackCityButton = AttackCityButton()
        messageCityButton = MessageCityButton()
        viewCityButton = ViewCityButton()
        addChild(attackCityButton!)
        addChild(messageCityButton!)
        addChild(viewCityButton!)
    }
    
    func setupOverlay() {
        overlay = GameSceneOverlay()
        view!.addSubview(overlay!)
        overlay!.autoPinEdge(.left, to: .left, of: view!)
        overlay!.autoPinEdge(.right, to: .right, of: view!)
        overlay!.autoPinEdge(.top, to: .top, of: view!)
        overlay!.autoPinEdge(.bottom, to: .bottom, of: view!)
        overlay!.setupUI()
        
        // allow tap gestures to be recognized
        overlay!.isUserInteractionEnabled = true
    }
    
    func setupAttackCityView() {
        marchSelectorView = MarchSelectorView()
        view!.addSubview(marchSelectorView!)
        marchSelectorView!.setup()
        hideMarchSelectorView()
    }
    
    func setupUIActions() {
        fatalError("no implementation")
    }
    
    // MARK: METHODS FOR MANAGING UI ELEMENTS
    
    func showMarchSelectorView() {
        marchSelectorView!.show()
    }

    func hideMarchSelectorView() {
        marchSelectorView!.hide()
    }
    
    func repositionButtons(location: CGPoint) {
        // get the tile (row, col) that we clicked and position
        let col = map!.tileColumnIndex(fromPosition: location)
        let row = map!.tileRowIndex(fromPosition: location)
        let tileCenter = map!.centerOfTile(atColumn: col, row: row)
        
        messageCityButton!.position = CGPoint(x: tileCenter.x - 64, y: tileCenter.y + 80)
        viewCityButton!.position = CGPoint(x: tileCenter.x, y: tileCenter.y + 120)
        attackCityButton!.position = CGPoint(x: tileCenter.x + 64, y: tileCenter.y + 80)
        
        colSelected = col
        rowSelected = row
    }
    
    func hideMapButtons() {
        messageCityButton!.isHidden = true
        viewCityButton!.isHidden = true
        attackCityButton!.isHidden = true
    }
    
    func showMapButtons() {
        messageCityButton!.isHidden = false
        viewCityButton!.isHidden = false
        attackCityButton!.isHidden = false
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
        
        // parse map from notification
        let mapData = notification.userInfo!["data"] as! [Map]
        
        // draw map
        map!.drawMapFromMapModel(map: mapData[0])
        
        // move camera to focus on map
        camera!.position = map!.centerOfTile(atColumn: 0, row: 0)
        let zoomAction = SKAction.scale(by: 1000, duration: 0)
        camera!.run(zoomAction)
    }
    
    func didGetMarches(_ notification: Notification) {
        print("GameScene recieved scene-did-get-marches event...")
        
        // parse marches from notification
        let newMarches = notification.userInfo!["data"] as! [March]
        
        // add all the marches to the map
        for march in newMarches {
            let marchNode = map!.addMarch(march: march)
            self.marches.append(marchNode)
        }
    }
    
    // MARK: PUBLISHING METHODS
    
    
    /**
     Called when a user tries to attack a city with a selected army.
     
     - parameter row: The row of the city that the user is trying to attack.
     - parameter col: The col of the city that the user is trying to attack.
     - parameter army: The units that the user is trying to attack with.
     */
    func createMarch(row: Int, col: Int, army: Army) {
        
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

    @objc func handlePan(panGesture: UIPanGestureRecognizer) {
        gestures!.handlePan(panGesture: panGesture, scene: self, camera: camera!)
        hideMapButtons()
    }

    @objc func handlePinch(pinchGesture: UIPinchGestureRecognizer) {
        gestures!.handlePinch(pinchGesture: pinchGesture, camera: camera!)
        hideMapButtons()
    }

    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
        
        let tapLocation = tapGesture.location(in: tapGesture.view)
        let location = self.convertPoint(fromView: tapLocation)
        // determine what was tapped (map, button, etc) and take appropriate action
        let node = self.atPoint(location)
        switch node.name {
        case GameSceneNodeNames.attackCityButton.rawValue:
            print("attack city button pressed")
            showMarchSelectorView()
        case GameSceneNodeNames.viewCityButton.rawValue:
            print("view")
        case GameSceneNodeNames.messageCityButton.rawValue:
            print("message")
        case GameSceneNodeNames.map.rawValue:
            print("map")
            repositionButtons(location: location)
            showMapButtons()
        default:
            print("Node with name \(node.name) pressed but doesn't have any action")
        }
    }

    // MARK: METHODS FOR HANDLING TILE BUTTON PRESSES

    func attackCityPressed() {
       
    }

    func messageCityPressed(location: CGPoint) {
       
    }

    func viewCityPressed(location: CGPoint) {
       
    }

}
