//
//  MarchSelectorFooter.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/20/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class MarchSelectorFooter: UIView {
    
    var cancelButton: UIButton
    var attackButton: UIButton
    
    override init(frame: CGRect) {
        
        cancelButton = UIButton()
        attackButton = UIButton()
        
        super.init(frame: frame)
        
        addSubview(cancelButton)
        cancelButton.backgroundColor = .red
        addSubview(attackButton)
        attackButton.backgroundColor = .green
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let height = self.frame.height
        let width = self.frame.width
        
        let buttonHeight = 2 * height / 3
        let buttonWidth = width / 3
        let heightOffset = (height - (buttonHeight)) / 2
        let widthOffset = (width - (2 * buttonWidth)) / 3
        
        cancelButton.autoSetDimension(.height, toSize: buttonHeight)
        cancelButton.autoSetDimension(.width, toSize: buttonWidth)
        cancelButton.autoPinEdge(.top, to: .top, of: self, withOffset: heightOffset)
        cancelButton.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)
        
        attackButton.autoSetDimension(.height, toSize: buttonHeight)
        attackButton.autoSetDimension(.width, toSize: buttonWidth)
        attackButton.autoPinEdge(.top, to: .top, of: self, withOffset: heightOffset)
        attackButton.autoPinEdge(.right, to: .right, of: self, withOffset: -widthOffset)
    }
}
