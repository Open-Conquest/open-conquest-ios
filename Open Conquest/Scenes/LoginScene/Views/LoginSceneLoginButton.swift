//
//  LoginSceneLoginButton.swift
//  Pixel Empire
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import UIKit


class LoginSceneLoginButton: UIButton {
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.setTitle("Login", for: UIControl.State.normal)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 18)
        
        // TODO enum
        self.backgroundColor = UIColor.gray
    }
}

