//
//  UnitIconView.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/19/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class UnitIconView: UIImageView {
    
    init(unitType: UnitType) {
        super.init(frame: .zero)
        
        switch unitType {
        case .bear:
            self.image = UIImage(named: "bear")
        case .wizard:
            self.image = UIImage(named: "wizard")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
