//
//  GenericLabel.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/10/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class GenericLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
