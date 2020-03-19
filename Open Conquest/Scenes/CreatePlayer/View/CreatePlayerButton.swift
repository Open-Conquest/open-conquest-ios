//
//  CreatePlayerButton.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class CreatePlayerButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
