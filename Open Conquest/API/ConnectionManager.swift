//
//  ConnectionManager.swift
//  Open Conquest
//
//  Created by zach on 6/3/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import Starscream

class ConnectionManager: WebSocketDelegate {
    
    var socket: WebSocket
    
    init() {
        socket = WebSocket(url: URL(string: "ws://localhost:1337")!, protocols: ["chat"])
        socket.delegate = self
        socket.connect()
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("did connect to server")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("did disconnect from server")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("did recieve data from server")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("did recieve message from server")
//        guard let data = text.data(using: .utf8) else {
//            fatalError("ConnectionHandler received non-utf8 encoded data.")
//        }
    }
    
    func send(message: String) {
        socket.write(string: message)
        print("wrote")
    }
    
}
