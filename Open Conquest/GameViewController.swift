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

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // start game
        let game = Game()
        
        let loginScene = LoginScene(game: game, size: UIScreen.main.bounds.size)
        loginScene.scaleMode = .aspectFill
        
        // present login scene
        if let view = self.view as! SKView? {
            view.presentScene(loginScene)
        }
        else {
            fatalError("Could not present LoginScene.")
        }
    }
    
    // lock app rotation
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
