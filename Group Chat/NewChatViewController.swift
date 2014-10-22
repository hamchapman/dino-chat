//
//  NewChatViewController.swift
//  GroupChat
//
//  Created by Hamilton Chapman on 20/10/2014.
//  Copyright (c) 2014 Pusher. All rights reserved.
//

import UIKit

class NewChatViewController: UIViewController {
    var chatCollection: ChatModel?
    var newChat: NSDictionary?
    
    @IBOutlet weak var chatName: UITextField!
    @IBAction func addNewChatButton(sender: AnyObject) {
        if let collection = self.chatCollection {
            newChat = collection.addChat(self.chatName.text)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let newChat = self.newChat {
                (segue.destinationViewController as ChatViewController).detailItem = newChat
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}