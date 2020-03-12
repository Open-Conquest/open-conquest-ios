//
//  ErrorMessageLabel.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/10/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class ErrorMessageLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /* setup appearance */
        textAlignment = .center
        font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        textColor = UIColor.red
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
