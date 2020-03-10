//
//  CreatePlayerScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import PureLayout

class CreatePlayerScene: SKScene, Scene {
    let publisher = CreatePlayerScenePublisher()
    let subscriber = Subscriber()
    let createPlayerView = CreatePlayerView(frame: .zero)

    override init() {
        super.init()
    }

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        setupSubscribers()
        setupUI()
        setupGestures()
        setupUIActions()
    }

    override func update(_ currentTime: TimeInterval) {}

    // MARK: SETUP METHODS
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: createNewPlayerSucceed(_:), name: .GameCreatePlayerSucceed)
        subscriber.subscribe(observingFunction: createNewPlayerFailed(_:), name: .GameCreatePlayerFailed)
    }

    func setupUI() {
        // setup march selector view
        view!.addSubview(createPlayerView)
        createPlayerView.autoPinEdge(.left, to: .left, of: view!)
        createPlayerView.autoPinEdge(.right, to: .right, of: view!)
        createPlayerView.autoPinEdge(.top, to: .top, of: view!)
        createPlayerView.autoPinEdge(.bottom, to: .bottom, of: view!)
    }

    func setupUIActions() {}

    func setupGestures() {
        createPlayerView.pickerCard.createPlayerButton.addTarget(
            self,
            action: #selector(self.createPlayerPressed(sender:)),
            for: .touchUpInside
        )
    }
    

    // MARK: CLEANUP METHODS

    /*
        Remove all subviews in preparation for navigation to another scene.
     */
    func prepareForNavigation() {
        for subview in view!.subviews {
            subview.removeFromSuperview()
        }
        teardownSubscribers()
    }

    /*
        Unsubscribe methods from notifications they previously subscribed to in setupSubscribers(:)
     */
    func teardownSubscribers() {
        subscriber.unsubscribe(observingFunction: createNewPlayerSucceed(_:))
        subscriber.unsubscribe(observingFunction: createNewPlayerFailed(_:))
    }

    // MARK: PUBLISHING METHODS

    /*
        Post a SceneTryCreateNewPlayer notification. Its expected that Game PlayerServices is subscribed
        to this notification and then will make an API request for it. This method should get the name
        for the player that the user wants to create from the UI and include it in the notification.
     */
    @objc func tryCreateNewPlayer() {
        print("CreatePlayerScene try create player button pressed")
        // get player name from view
        let playerName = createPlayerView.pickerCard.playernameField.text
        publisher.tryCreatePlayer(name: playerName!)
    }
    
    /*
        This method is subscribed to the GameCreatePlayerSucceed notification, which means that it'll be
        called one PlayerServices posts a message indicating that a new player has been created for the
        user using this client. The notification won't include any data but once it's received we should
        present the loading scene.
     */
    func createNewPlayerSucceed(_ notifiction: Notification) {
        print("CreatePlayerScene received GameCreateNewPlayerSucceed notification")
        // present loading scene
        prepareForNavigation()
        let scene = LoadingScene()
        scene.scaleMode = .aspectFill
        view!.presentScene(scene)
    }
    
    /*
        This method is subscribed to the GameCreatePlayerFailed notification, which means that an attempt to
        create a new player by the user of this client failed. The notification should contain an error message
        in it's data which this method should display in the UI.
     */
    func createNewPlayerFailed(_ notifiction: Notification) {
        print("CreatePlayerScene received GameCreateNewPlayerFailed notification")
        
        // set some error message...
    }

    // MARK: GESTURING METHODS
    
    /*
        This method is triggered when the create player button is pressed. It should call the tryCreateNewPlayer
        method which will post a SceneTryCreateNewPlayer notification.
     */
    @IBAction func createPlayerPressed(sender: UIButton) {
        print("Create new player button pressed")
        tryCreateNewPlayer()
    }

    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
    }
}
