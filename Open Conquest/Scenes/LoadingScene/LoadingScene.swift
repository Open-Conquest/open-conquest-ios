//
//  LoadingScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class LoadingScene: Scene {
    var loadingView: LoadingSceneView
    var publisher: LoadingScenePublisher
    var subscriber: Subscriber
    var componentsLoaded: Int = 0
    var totalComponents: Int = 5

    // MARK: INITIALIZATION METHODS
    
    override init() {
        self.loadingView = LoadingSceneView(frame: UIScreen.main.bounds)
        self.publisher = LoadingScenePublisher()
        self.subscriber = Subscriber()
//        super.init(size: UIScreen.main.bounds.size, viewController: viewController)
        super.init()
    }
    
    override func didMove(to view: SKView) {
        print("DidMoveTo LoadingScene")
        setupSubscribers()
        setupUI()
        setupUIActions()
        tryLoading()
    }
    
    // MARK: SETUP METHODS
    
    override func setupSubscribers() {
        subscriber.subscribe(observingFunction: gotArmies(_:),  name: .GameDidGetArmies)
        subscriber.subscribe(observingFunction: gotCities(_:),  name: .GameDidGetCities)
        subscriber.subscribe(observingFunction: gotMap(_:),     name: .GameDidGetMap)
        subscriber.subscribe(observingFunction: gotMarches(_:), name: .GameDidGetMarches)
        subscriber.subscribe(observingFunction: gotUsers(_:),   name: .GameDidGetUsers)
    }
    
    override func setupUI() {
        view!.addSubview(loadingView)
        let screenSize = UIScreen.main.bounds.size
        loadingView.setup()
        loadingView.autoSetDimension(.height, toSize: screenSize.height)
        loadingView.autoSetDimension(.width, toSize: screenSize.width)
    }
    
    override func setupUIActions() {
    }
    
    override func prepareForNavigation() {
        print("perp")
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (componentsLoaded == totalComponents) {
            presentGameScene()
        }
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
        // perform ui cleanup before scene transition
        loadingView.removeFromSuperview()
        // present game scene
        let gameScene = GameScene(size: UIScreen.main.bounds.size)
        gameScene.scaleMode = .aspectFill
        let view = self.view!
        view.presentScene(gameScene)
    }
    
    // MARK: UI METHODS

    func updateProgressBar() {
        componentsLoaded += 1
        
        loadingView.progressBar!.progress = Float(componentsLoaded) / Float(totalComponents)
        loadingView.progressBar!.setProgress(loadingView.progressBar!.progress, animated: true)
        
        loadingView.progressLabel!.text = String((Float(componentsLoaded) / Float(totalComponents)))
    }
    
    // MARK: REQUIRED METHODS
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
