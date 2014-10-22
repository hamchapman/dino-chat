//
//  MessageModel.swift
//  GroupChat
//
//  Created by Hamilton Chapman on 20/10/2014.
//  Copyright (c) 2014 Pusher. All rights reserved.
//

import Foundation

class MessageModel {
    
    var messages: NSMutableArray
    
    init () {
        self.messages = [
            [
                "name": "Test name 1",
                "sender": "Joe"
            ],
            [
                "name": "Test name 2",
                "sender": "Tom"
            ]
        ]
    }
    
    func getMessages() -> NSMutableArray {
        return self.messages
    }
    
    func addMessage(message: String) {
        self.messages.insertObject(["name": message, "sender": "Joe"], atIndex: self.messages.count)
//        return message
    }
}