//
//  LoginSceneGameImage.swift
//  Pixel Empire
//
//  Created by Zach Wild on 5/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class LoginSceneGameImage: UIImageView {
    
    init() {
        let backgroundImage = UIImage(named: "WizardLogo")
        super.init(image: backgroundImage)
    }
    
    override init(image: UIImage?) {
        let backgroundImage = UIImage(named: "WizardLogo")
        super.init(image: backgroundImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
