//
//  LoginUserErrorResponseDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class LoginUserErrorResponseDTO: Response {
    let message: String

    init(response: Response) {
        let responseData = response.getData()
        message = responseData["message"].string!
        super.init(service: .User, operation: .LoginUserError, data: response.getData())
    }
    
    func getMessage() -> String {
        return message
    }
}
