//
//  LoadingSceneBackground.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import UIKit

class LoadingSceneBackground: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
