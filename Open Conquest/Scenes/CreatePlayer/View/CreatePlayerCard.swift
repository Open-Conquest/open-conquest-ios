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
    
    init(frame: CGRect) {
        createPlayerButton = CreatePlayerButton(frame: .zero)
        super.init(frame: frame)
        addSubview(createPlayerButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
