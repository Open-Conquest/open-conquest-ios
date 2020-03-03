//
//  CreatePlayerScene.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SpriteKit
import PureLayout

class CreatePlayerScene: SKScene, Scene {
    let publisher: CreatePlayerScenePublisher
    let subscriber: Subscriber

    let createPlayerView: CreatePlayerView

    override init() {
        publisher = CreatePlayerScenePublisher()
        subscriber = Subscriber()
        createPlayerView = CreatePlayerView(frame: .zero)
        super.init()
    }

    override init(size: CGSize) {
        publisher = CreatePlayerScenePublisher()
        subscriber = Subscriber()
        createPlayerView = CreatePlayerView(frame: .zero)
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        setupUI()
        setupGestures()
        setupUIActions()
        setupSubscribers()
    }

    override func update(_ currentTime: TimeInterval) {}

    // MARK: SETUP METHODS

    func setupUI() {
        // setup march selector view
        view!.addSubview(createPlayerView)
        createPlayerView.autoPinEdge(.left, to: .left, of: view!)
        createPlayerView.autoPinEdge(.right, to: .right, of: view!)
        createPlayerView.autoPinEdge(.top, to: .top, of: view!)
        createPlayerView.autoPinEdge(.bottom, to: .bottom, of: view!)
    }

    func setupSubscribers() {
//        subscriber.subscribe(observingFunction: didGetWorldPlayersCount(_:), name: .GameDidGetWorldPlayersCount)
    }

    func setupGestures() {}
    
    func setupUIActions() {
        let tryCreatePlayer = #selector(self.tryCreateNewPlayer:))
        createPlayerView.pickerCard.createPlayerButton.addTarget(tryCreateNewPlayer(), action: tryCreatePlayer, for: .touchUpInside)
    }

    // MARK: CLEANUP METHODS

    func prepareForNavigation() {
        for subview in view!.subviews {
            subview.removeFromSuperview()
        }
        teardownSubscribers()
    }

    func teardownSubscribers() {
        // todo
    }

    // MARK: SUBSCRIBING METHODS
    
    func didGetWorldPlayersCount(_ notifiction: Notification) {
        print("CreatePlayerScene received GameDidGetWorldPlayersCount notification")
        // todo
    }

    // MARK: PUBLISHING METHODS

    @objc func tryCreateNewPlayer() {
        print("CreatePlayerScene try create player button pressed")
    }
    
    func createNewPlayerFailed(_ notifiction: Notification) {
        print("CreatePlayerScene received GameCreateNewPlayerSucceed notification")
        // todo
    }
    
    func createNewPlayerSucceed(_ notifiction: Notification) {
        print("CreatePlayerScene received GameCreateNewPlayerFailed notification")
        // todo
    }

    // MARK: GESTURING METHODS

    @objc func handleTap(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state != .ended {
            return
        }
    }
}
