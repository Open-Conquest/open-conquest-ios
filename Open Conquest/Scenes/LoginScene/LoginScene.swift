//
//  LoginScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class LoginScene: SKScene {
    let loginView: LoginSceneView
    let publisher: LoginScenePublisher
    let game: Game

    // MARK: INITIALIZATION METHODS
    
    init(game: Game, size: CGSize) {
        self.game = game
        self.publisher = LoginScenePublisher()
        self.loginView = LoginSceneView(frame: UIScreen.main.bounds)
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        setupUI()
        setupUIActions()
    }
    
    // MARK: SETUP METHODS
    
    func setupUI() {
        view!.addSubview(loginView)
        let screenSize = UIScreen.main.bounds.size
        loginView.setup()
        loginView.autoSetDimension(.height, toSize: screenSize.height)
        loginView.autoSetDimension(.width, toSize: screenSize.width)
    }
    
    func setupUIActions() {
        loginView.loginButton!.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
    }
    
    // MARK: PUBLISHING METHODS
    
    @objc func tryLogin() {
        let username = loginView.getUsername()
        let password = loginView.getPassword()
        // emit tryLogin event (listented to by userservice)
        // post event to try to login
        let loginResult = game.tryLogin(username: username, password: password)
        print(loginResult)
        if (loginResult == true) {
            print("presnt game scene")
            presentGameScene()
        }
    }
    
    // MARK: NAVIGATION METHODS
        
    func presentGameScene() {
        // cleanup current scene's views
        loginView.removeFromSuperview()
        // present game scene
        let gameScene = GameScene(game: game, size: UIScreen.main.bounds.size)
        gameScene.scaleMode = .aspectFill
        let view = self.view!
        view.presentScene(gameScene)
    }
    
    // MARK: REQUIRED METHODS
    
    override func update(_ currentTime: TimeInterval) {}
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
