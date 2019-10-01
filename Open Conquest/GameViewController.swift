//
//  GameViewController.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

// need to create all these fuckin things

// game scenes
// game services
// game controllers
// api services

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // present initial scene... if not logged in
        startGame()
    }
    
    func startGame() {
        let game = Game()
        let loginScene = LoginScene(game: game, size: UIScreen.main.bounds.size)
        presentLoginScene(loginScene: loginScene)
    }
    
    func presentLoginScene(loginScene: LoginScene) {
        loginScene.scaleMode = .aspectFill
        let view = self.view as! SKView
        view.presentScene(loginScene)
    }
    
    // lock app rotation & hide status bar
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
