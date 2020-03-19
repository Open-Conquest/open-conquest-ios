//
//  Token.swift
//  Open Conquest
//
//  Created by Zach Wild on 2/28/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class Token {
    var value: String
    
    init(value: String) {
        self.value = value
    }
    
    func getValue() -> String {
        return value
    }
}
