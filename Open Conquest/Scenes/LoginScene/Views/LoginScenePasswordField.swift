//
//  LoginScenePasswordField.swift
//  Pixel Empire
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class LoginScenePasswordField: UITextField {
    var bottomLine: CALayer
    
    init() {
        bottomLine = CALayer()
        super.init(frame: CGRect.zero)
        setup()
        self.layer.addSublayer(bottomLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.placeholder = "Password"
        self.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
        self.textColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (frame == .zero) {
            return
        }
        
        bottomLine.frame = CGRect(x: 0.0, y: 50 - 1, width: frame.width, height: 4.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
}

