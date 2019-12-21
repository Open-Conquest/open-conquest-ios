//
//  Scene.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/11/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SpriteKit

protocol Scene {
    
    func setupUI()
    
    func setupUIActions()
    
    func prepareForNavigation()
    
    func setupSubscribers()
    
    func teardownSubscribers()
    
}
