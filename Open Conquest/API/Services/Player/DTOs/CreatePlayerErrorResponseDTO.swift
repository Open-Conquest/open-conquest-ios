//
//  CreatePlayerErrorResponseDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/8/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class CreatePlayerErrorResponseDTO {
    let message: String
    
    init(response: Response) {
        self.message = response.getData()["message"].string!
    }
    
    func getMessage() -> String {
        return message
    }
}
