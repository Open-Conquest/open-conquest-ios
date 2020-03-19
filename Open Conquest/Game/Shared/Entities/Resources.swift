//
//  Resources.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/6/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class ResourceComponent {
    
}

enum ResourceEnum: String {
    case gold = "gold"
    case power = "power"
}

class Resources {
    var gold: Int
    
    init(gold: Int) {
        self.gold = gold
    }
}
