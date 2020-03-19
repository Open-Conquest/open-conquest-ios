//
//  Connection.swift
//  Open Conquest
//
//  Connection is responsible for maintaining a connection to the game's
//  websocket server. It is responsible for delivering requests for the API
//  and dispatching messages received from the server as notifications to the API.
//
//  Created by Zach Wild on 10/3/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON

class Connection: WebSocketDelegate {
    var subscriber: Subscriber
    var messageDispatch: ConnectionMessageDispatch
    var socket: WebSocket
    
    init() {
        subscriber = Subscriber()
        messageDispatch = ConnectionMessageDispatch()
        
        socket = WebSocket(url: URL(string: "ws://localhost:1337")!, protocols: ["chat"])
        socket.delegate = self
        socket.connect()
        
        setupSubscribers()
    }
    
    func setupSubscribers() {
        // listen for requests coming from api services
        subscriber.subscribe(observingFunction: send(_:), name: .APIMakeRequest)
    }

    func websocketDidConnect(socket: WebSocketClient) {
        print("Connection did connect to server.")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("Connection did disconnect from server.")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        fatalError("Connection should not receive data from server.")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("Connection did receive message from server.")
       
        guard let data = text.data(using: .utf8) else {
            fatalError("ConnectionHandler received non-utf8 encoded data.")
        }
        let json = try? JSON(data: data)
        messageDispatch.handle(json: json!)
    }
    
    func send(_ notification: Notification) {
        let request = notification.userInfo!["data"]! as! Request
        let requestString = request.toString()
        print("Sending request to server: \(requestString)")
        socket.write(string: requestString)
    }
}
