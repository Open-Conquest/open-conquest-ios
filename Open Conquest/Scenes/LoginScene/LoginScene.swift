//
//  LoginScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class LoginScene: SKScene {
    let game: Game
    let observer: LoginSceneObserver
    let poster: LoginScenePoster
    let loginSceneView: LoginSceneView
    
    init(game: Game, size: CGSize) {
        self.game = game
        self.observer = LoginSceneObserver()
        self.poster = LoginScenePoster()
        self.loginSceneView = LoginSceneView(frame: UIScreen.main.bounds)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        setupNotifications()
        setupUI()
        setupActions()
    }
    
    override func update(_ currentTime: TimeInterval) {}
    
    // MARK: SETUP FUNCTIONS
    
    func setupNotifications() { // observe notifications from game (ie. successful login event)
        observer.setupObservers(scene: self)
    }
    
    func setupUI() {            // sets up all views and subviews for the screen
        view!.addSubview(loginSceneView)
        let screenSize = UIScreen.main.bounds.size
        loginSceneView.setup()
        loginSceneView.autoSetDimension(.height, toSize: screenSize.height)
        loginSceneView.autoSetDimension(.width, toSize: screenSize.width)
    }
    
    func setupActions() {       // make methods listen for things happening in scene (ie. clicks)
        loginSceneView.loginButton!.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
    }
    
    // MARK: POSTING FUNCTIONS
    
    @objc func tryLogin() {
        let username = loginSceneView.getUsername()
        let password = loginSceneView.getPassword()
        poster.tryLogin(username: username, password: password)
    }
    
    // MARK: OBSERVING FUNCTIONS
    
    @objc func userDidLoginSuccessfully(_ notification: Notification) {
        // when recieve a successful login response from gane
        presentGameScene()
    }
    
    // MARK: NAVIGATION FUNCTIONS
    
    func presentGameScene() {
        loginSceneView.removeFromSuperview()
        let screenSize = UIScreen.main.bounds.size
        let gameScene = GameScene(game: game, size: screenSize)
        gameScene.scaleMode = .aspectFill
        view!.presentScene(gameScene)
    }
    
}
