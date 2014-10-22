//
//  ChatModel.swift
//  GroupChat
//
//  Created by Hamilton Chapman on 20/10/2014.
//  Copyright (c) 2014 Pusher. All rights reserved.
//

import Foundation
import Alamofire

class ChatModel {
    
    var chats: NSMutableArray
    
    init () {
        self.chats = [
            [
                "name": "Test name 1"
            ],
            [
                "name": "Test name 2"
            ]
        ]
    }
    
    func getChats(callback: (NSMutableArray) -> Void) -> NSMutableArray {
//        if self.chats.count == 0 {
            Alamofire.request(.GET, "http://dino-chat.herokuapp.com/chats.json")
                .responseJSON { (_, _, json, _) in
                    if json != nil {
                        println(json)
//                        self.chats = json!["chats"] as NSMutableArray
                        callback(self.chats)
                    }
            }
//        }
        return self.chats
    }
    
    func addChat(chatName: String) -> NSDictionary {
        let newChat = ["name": chatName]
        self.chats.insertObject(newChat, atIndex: self.chats.count)
        return newChat
    }
}