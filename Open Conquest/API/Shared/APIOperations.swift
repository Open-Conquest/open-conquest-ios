//
//  ServiceOperations.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/1/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

enum APIOperations: String {
    case LoginUser  = "loginUser"
    case LoginUserError = "loginUserError"
    case RegisterUser = "registerUser"
    case RegisterUserError = "registerUserError"
    case CreatePlayer = "createPlayer"
    case CreatePlayerError = "createPlayerError"
}
