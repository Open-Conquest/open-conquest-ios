//
//  LoadingScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class LoadingScene: SKScene, Scene {
    var loadingView: LoadingSceneView
    var publisher: LoadingScenePublisher
    var subscriber: Subscriber
    var componentsLoaded: Int = 0
    let totalComponents: Int = 5

    // MARK: INITIALIZATION METHODS
    
    override init() {
        self.loadingView = LoadingSceneView(frame: UIScreen.main.bounds)
        self.publisher = LoadingScenePublisher()
        self.subscriber = Subscriber()
        super.init()
    }
    
    override init(size: CGSize) {
        self.loadingView = LoadingSceneView(frame: UIScreen.main.bounds)
        self.publisher = LoadingScenePublisher()
        self.subscriber = Subscriber()
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        print("DidMoveTo LoadingScene")
        setupSubscribers()
        setupUI()
        setupUIActions()
        tryLoading()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (componentsLoaded == totalComponents) {
            presentGameScene()
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: SETUP METHODS
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: gotArmies(_:),  name: .GameDidGetWorld)
    }
    
    func setupUI() {
        view!.addSubview(loadingView)
        let screenSize = UIScreen.main.bounds.size
        loadingView.setup()
        loadingView.autoSetDimension(.height, toSize: screenSize.height)
        loadingView.autoSetDimension(.width, toSize: screenSize.width)
    }
    
    func setupUIActions() {
        // do nothing
    }
    
    func setupGestures() {
        // do nothing
    }
    
    // MARK: CLEANUP METHODS
    
    func teardownSubscribers() {
        subscriber.unsubscribe(observingFunction: gotArmies(_:))
        subscriber.unsubscribe(observingFunction: gotCities(_:))
        subscriber.unsubscribe(observingFunction: gotMap(_:))
        subscriber.unsubscribe(observingFunction: gotMarches(_:))
        subscriber.unsubscribe(observingFunction: gotUsers(_:))
    }
    
    func prepareForNavigation() {
        loadingView.removeFromSuperview()
        teardownSubscribers()
    }
    
    // MARK: PUBLISHING METHODS
    
    @objc func tryLoading() {
        print("LoadingScene trying to load game...")
        publisher.getAllGameComponents()
    }
    
    // MARK: SUBSCRIBING METHODS
    
    func gotArmies(_ notification: Notification) {
        // duplicated code -- remove by adding wrapper to response? something
        // todo later not so important right now
        print("LoadingScene received DidGetArmies event from game.")
        updateProgressBar()
    }
    
    func gotCities(_ notification: Notification) {
        print("LoadingScene received cityLoaded event from game.")
        updateProgressBar()
    }
    
    func gotMap(_ notification: Notification) {
        print("LoadingScene received mapLoaded event from game.")
        updateProgressBar()
    }
    
    func gotMarches(_ notification: Notification) {
        print("LoadingScene received marchLoaded event from game.")
        updateProgressBar()
    }
    
    func gotUsers(_ notification: Notification) {
        print("LoadingScene received DidGetUsers event from game.")
        updateProgressBar()
    }
    
    // MARK: NAVIGATION METHODS
        
    func presentGameScene() {
        print("LoadingScene presenting GameScene...")
        
        prepareForNavigation()
        let scene = GameScene()
        scene.scaleMode = .aspectFill
        view!.presentScene(scene)
    }
    
    // MARK: UI METHODS

    func updateProgressBar() {
        componentsLoaded += 1
        
        loadingView.progressBar!.progress = Float(componentsLoaded) / Float(totalComponents)
        loadingView.progressBar!.setProgress(loadingView.progressBar!.progress, animated: true)
        
        loadingView.progressLabel!.text = String((Float(componentsLoaded) / Float(totalComponents)))
    }
}
