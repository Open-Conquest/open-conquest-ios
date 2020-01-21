//
//  GetUsersResponse.swift
//  Open Conquest
//
//  Created by Zach Wild on 11/19/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class GetUsersResponse: Response {
    
    var users: [User] = [User]()
    
    init(response: Response) {
        if let users = response.getData().array {
            for user in users {
                if let username = user["user_name"].string {
                    self.users.append(User(username: username))
                }
            }
        }
//        self.users = response.getData()["users"]
        super.init(service: response.getService().rawValue, operation: response.getOperation().rawValue, data: response.getData())
    }
    
    func getUsers() -> [User] {
        return self.users
    }
}
