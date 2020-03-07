//
//  CreatePlayerCard.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class CreatePlayerCard: UIView {
    let createPlayerButton: CreatePlayerButton
    
    override init(frame: CGRect) {
        createPlayerButton = CreatePlayerButton(frame: .zero)
        super.init(frame: frame)
        addSubview(createPlayerButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = self.frame.height
        let width = self.frame.width
        let heightOffset = height / 4
        let widthOffset = width / 6
        createPlayerButton.autoPinEdge(.left, to: .left, of: self, withOffset: widthOffset)
        createPlayerButton.autoPinEdge(.right, to: .right, of: self, withOffset: -widthOffset)
        createPlayerButton.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: -heightOffset)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
