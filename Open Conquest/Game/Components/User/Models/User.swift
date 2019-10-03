//
//  User.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/8/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class User: GameComponentModel {
    
    required init(json: JSON) {
        fatalError()
    }
    
    func toJSON() -> JSON {
        fatalError()
    }
    
    var username: String
    
    init(username: String) {
        self.username = username
    }
    
    init(apiLoginSucceedData: APILoginSucceedData) {
        self.username = apiLoginSucceedData.getUsername()
    }
    
    func getUsername() -> String {
        return username
    }
}
