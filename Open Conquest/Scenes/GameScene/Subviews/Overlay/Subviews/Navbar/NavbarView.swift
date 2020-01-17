//
//  NavbarView.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/13/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class NavbarView: UIView {
    
    // buttons
    var armyButton = NavbarButton(type: .army)
    var messageButton = NavbarButton(type: .message)
    var homeButton = NavbarButton(type: .view)
    
    func setupUI() {
        
        backgroundColor = .white
        
        // MARK: remove and find a better solution
        
        let buttonHeight = UIScreen.main.bounds.height / 11
        let buttonWidth = buttonHeight
        let buttonWidthSpacing = (UIScreen.main.bounds.width - buttonWidth*3) / 4
        
        // add buttons and setup constraints
        armyButton.autoSetDimensions(to: CGSize(width: buttonWidth, height: buttonHeight))
        addSubview(armyButton)
        armyButton.autoPinEdge(.top, to: .top, of: self, withOffset: -buttonHeight/3)
        armyButton.autoPinEdge(.left, to: .left, of: self, withOffset: buttonWidthSpacing)
        
        homeButton.autoSetDimensions(to: CGSize(width: buttonWidth, height: buttonHeight))
        addSubview(homeButton)
        homeButton.autoPinEdge(.top, to: .top, of: self, withOffset: -buttonHeight/3)
        homeButton.autoPinEdge(.left, to: .right, of: armyButton, withOffset: buttonWidthSpacing)
        
        messageButton.autoSetDimensions(to: CGSize(width: buttonWidth, height: buttonHeight))
        addSubview(messageButton)
        messageButton.autoPinEdge(.top, to: .top, of: self, withOffset: -buttonHeight/3)
        messageButton.autoPinEdge(.left, to: .right, of: homeButton, withOffset: buttonWidthSpacing)
    }
    
}
