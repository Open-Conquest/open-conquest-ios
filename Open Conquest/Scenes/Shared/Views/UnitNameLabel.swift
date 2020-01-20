//
//  UnitNameLabel.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/19/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class UnitNameLabel: UILabel {
    
    init(unitType: UnitType) {
        
        super.init(frame: .zero)
        
        font = UIFont(name: "Chalkboard", size: 16)
        
        switch unitType {
        case .bear:
            text = "Bear"
        case .wizard:
            text = "Wizard"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
