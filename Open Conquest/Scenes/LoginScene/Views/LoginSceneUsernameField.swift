//
//  LoginSceneUsernameField.swift
//  Pixel Empire
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class LoginSceneUsernameField: UITextField {
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.textColor = UIColor.white
        self.placeholder = "\tusername"
        self.font = UIFont(name: "Chalkduster", size: 24)
        self.backgroundColor = UIColor.gray
    }
}
