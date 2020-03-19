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
    let totalComponents: Int = 1
    var world: World?

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
        tryGetWorld()
    }
    
    override func update(_ currentTime: TimeInterval) {}
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: SETUP METHODS
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: didGetWorld(_:),  name: .GameDidGetWorld)
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
        subscriber.unsubscribeAllObservers()
//        subscriber.unsubscribe(observingFunction: didGetWorld(_:))
    }
    
    func prepareForNavigation() {
        for subview in loadingView.subviews {
            subview.removeFromSuperview()
        }
        loadingView.removeFromSuperview()
        teardownSubscribers()
    }
    
    // MARK: PUBLISHING METHODS
    
    func tryGetWorld() {
        print("LoadingScene trying to load game...")
        publisher.tryGetWorld()
    }
    
    // MARK: SUBSCRIBING METHODS
    
    func didGetWorld(_ notification: Notification) {
        print("LoadingScene received DidGetWorld event from game.")
        
        world = notification.userInfo!["data"] as! World
        
        presentGameScene()
    }
    
    // MARK: NAVIGATION METHODS
        
    func presentGameScene() {
        print("LoadingScene presenting GameScene...")
        
        prepareForNavigation()
        
        let scene = GameScene(size: size)
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
