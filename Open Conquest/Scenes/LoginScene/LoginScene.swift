//
//  LoginScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import SpriteKit

enum LoginSceneMode {
    case Login
    case Register
}

class LoginScene: SKScene, Scene {
    var loginView:      LoginSceneView
    var publisher:      LoginScenePublisher
    var subscriber:     Subscriber
    var mode:           LoginSceneMode
    
    override init() {
        self.loginView      = LoginSceneView(frame: UIScreen.main.bounds)
        self.publisher      = LoginScenePublisher()
        self.subscriber     = Subscriber()
        self.mode           = .Login
        super.init()
    }
    
    override init(size: CGSize) {
        self.loginView      = LoginSceneView(frame: UIScreen.main.bounds)
        self.publisher      = LoginScenePublisher()
        self.subscriber     = Subscriber()
        self.mode           = .Login
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        print("DidMoveTo LoginScene")
        setupSubscribers()
        setupUI()
        setupUIActions()
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: loginSucceeded(_:), name: .GameLoginSucceed)
        subscriber.subscribe(observingFunction: registerSucceeded(_:), name: .GameRegisterSucceed)
        subscriber.subscribe(observingFunction: loginFailed(_:), name: .GameLoginFailed)
        subscriber.subscribe(observingFunction: registerFailed(_:), name: .GameRegisterFailed)
    }
    
    func teardownSubscribers() {
        subscriber.unsubscribe(observingFunction: loginSucceeded(_:))
        subscriber.unsubscribe(observingFunction: registerSucceeded(_:))
        subscriber.unsubscribe(observingFunction: loginFailed(_:))
        subscriber.unsubscribe(observingFunction: registerFailed(_:))
    }
    
    func setupUI() {
        view!.addSubview(loginView)
        let screenSize = UIScreen.main.bounds.size
        loginView.setup()
        loginView.autoSetDimension(.height, toSize: screenSize.height)
        loginView.autoSetDimension(.width, toSize: screenSize.width)
    }
    
    func setupUIActions() {
        loginView.loginButton!.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
        loginView.switchModeButton!.addTarget(self, action: #selector(switchMode), for: .touchUpInside)
    }
    
    func setupGestures() {
        // do nothing
    }
    
    func prepareForNavigation() {
        for subview in loginView.subviews {
            subview.removeFromSuperview()
        }
        loginView.removeFromSuperview()
        teardownSubscribers()
    }
    
    // MARK: UI RESPONDING METHODS
    
    @objc func tryLogin() {
        print("LoginScene user pressed login button.")

        switch mode {
        case .Login:
            let username = loginView.getUsername()
            let password = loginView.getPassword()
            publisher.tryLogin(username: username, password: password)
        case .Register:
            let username = loginView.getUsername()
            let password = loginView.getPassword()
            publisher.tryRegister(username: username, password: password)
        }
    }
    
    @objc func switchMode() {
        switch mode {
        case .Login:
            self.mode = .Register
            loginView.switchMode(mode: .Register)
        case .Register:
            self.mode = .Login
            loginView.switchMode(mode: .Login)
        }
    }
    
    // MARK: PUBLISHING AND SUBSCRIBING METHODS
    
    func loginSucceeded(_ notification: Notification) {
        print("LoginScene recieved loginSucceed event from game.")
        print("LoginScene presenting PickPlayerScene...")
        loginView.setErrorMessage(message: "")
//        prepareForNavigation()
//        let scene = LoadingScene()
//        scene.scaleMode = .aspectFill
//        view!.presentScene(scene)
    }
    
    func loginFailed(_ notification: Notification) {
        print("LoginScene recieved loginFailed event from game.")
        // get message from notification
        let loginFailedData = notification.userInfo!["data"] as! GameLoginFailedData
        loginView.setErrorMessage(message: loginFailedData.getMessage())
    }
    
    func registerSucceeded(_ notification: Notification) {
        print("LoginScene recieved registerSucceed event from game.")
        print("LoginScene presenting CreatePlayerScene...")
        loginView.setErrorMessage(message: "")
        //        prepareForNavigation()
        //        let scene = LoadingScene()
        //        scene.scaleMode = .aspectFill
        //        view!.presentScene(scene)
    }
    
    func registerFailed(_ notification: Notification) {
        print("LoginScene recieved registerSucceed event from game.")
        let registerFailedData = notification.userInfo!["data"] as! GameRegisterFailedData
        loginView.setErrorMessage(message: registerFailedData.getMessage())
    }
    
    override func update(_ currentTime: TimeInterval) {}
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
