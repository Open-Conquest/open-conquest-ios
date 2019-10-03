//
//  LoginScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

class LoginScene: Scene  {
    var loginView:      LoginSceneView
    var publisher:      LoginScenePublisher
    var subscriber:     Subscriber
    
    init(viewController: GameViewController) {
        self.loginView      = LoginSceneView(frame: UIScreen.main.bounds)
        self.publisher      = LoginScenePublisher()
        self.subscriber     = Subscriber()
//        super.init(size: UIScreen.main.bounds.size, viewController: viewController)
        super.init()
    }
    
    override func didMove(to view: SKView) {
        print("DidMoveTo LoginScene")
        setupSubscribers()
        setupUI()
        setupUIActions()
    }
    
    override func setupSubscribers() {
        subscriber.subscribe(observingFunction: loginSucceeded(_:), name: .GameLoginSucceed)
    }
    
    override func teardownSubscribers() {
        subscriber.unsubscribe(observingFunction: loginSucceeded(_:))
    }
    
    override func setupUI() {
        view!.addSubview(loginView)
        let screenSize = UIScreen.main.bounds.size
        loginView.setup()
        loginView.autoSetDimension(.height, toSize: screenSize.height)
        loginView.autoSetDimension(.width, toSize: screenSize.width)
    }
    
    override func setupUIActions() {
        loginView.loginButton!.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
    }
    
    override func prepareForNavigation() {
        loginView.removeFromSuperview()
        teardownSubscribers()
    }
    
    // MARK: PUBLISHING AND SUBSCRIBING METHODS
    
    @objc func tryLogin() {
        print("LoginScene user pressed login button.")
        let username = loginView.getUsername()
        let password = loginView.getPassword()
        publisher.tryLogin(username: username, password: password)
    }
    
    func loginSucceeded(_ notification: Notification) {
        print("LoginScene recieved loginSucceed event from game.")
        print("LoginScene presenting LoadingScene...")
//        viewController!.presentLoadingScene()
        if let view = self.view as? SKView {
            let scene = LoadingScene()
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {}
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
