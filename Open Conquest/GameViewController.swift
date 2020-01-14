//
//  GameViewController.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/26/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: SKScene?
    var game: Game?
    var api: API?
    var connection: Connection?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get core data managed context from app delegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        game        = Game(dataContext: context)
        api         = API()
        scene       = LoginScene()
        connection  = Connection()
        
        if let view = self.view as? SKView {
            scene!.scaleMode = .aspectFill
            view.presentScene(scene)
        }
    }
  
    // lock app rotation & hide status bar
    override var shouldAutorotate: Bool { return false }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .allButUpsideDown }
    override var prefersStatusBarHidden: Bool { return true }
}
