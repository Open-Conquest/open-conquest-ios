//
//  NavbarButton.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/13/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

enum NavbarButtonType {
    case army
    case message
    case view
}

class NavbarButton: UIButton {
    
    init(type: NavbarButtonType) {
        
        super.init(frame: CGRect.zero)
        
        switch type {
        case .army:
            let armyImage = UIImage(named: "attack-city-button")
            setImage(armyImage, for: .normal)
        case .message:
            let messageImage = UIImage(named: "message-city-button")
            setImage(messageImage, for: .normal)
        case .view:
            let viewImage = UIImage(named: "view-city-button")
            setImage(viewImage, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
