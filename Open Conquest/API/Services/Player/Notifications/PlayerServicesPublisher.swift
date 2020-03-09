//
//  PlayerServicesPublisher.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class PlayerServicesPublisher: Publisher {
    
    let apiNotificationFactory: APINotificationFactory
    
    override init() {
        apiNotificationFactory = APINotificationFactory()
        super.init()
    }
    
    // MARK: CONNECTION PUBLISHING METHODS

    func tryCreatePlayer(token: Token, player: PlayerDTO) {
        // TODO: include the users token from logging in with the request
        let data = CreatePlayerRequestDTO(token: token, player: player)
        let notification = apiNotificationFactory.buildNotification(name: .APIMakeRequest, data: data)
        post(notification: notification)
    }
    
    // MARK: GAME PUBLISHING METHODS

    func createPlayerSucceed(player: Player) {
        let notif = notificationFactory.buildNotification(name: .APICreatePlayerSucceed, data: player)
        post(notification: notif)
    }
}
