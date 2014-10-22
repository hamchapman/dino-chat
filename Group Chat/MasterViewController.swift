//
//  MasterViewController.swift
//  GroupChat
//
//  Created by Hamilton Chapman on 20/10/2014.
//  Copyright (c) 2014 Pusher. All rights reserved.
//

import UIKit
import Alamofire

class MasterViewController: UITableViewController {
    var chatModel = ChatModel()
    var objects = NSArray()
    
//    PTPusherDelegate
//    var client = PTPusher()
    
//        client = PTPusher.pusherWithKey("9dfb6b429f61e6eefb3b", delegate: self, encrypted:false) as PTPusher
//        var channel = client.subscribeToChannelNamed("2")
//
//        channel.bindToEventNamed("new_message", handleWithBlock: { channelEvent in
//            var message = channelEvent.data.objectForKey("content") as String
//            println(message)
//        })
//
//        client.connect()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.chatModel.getChats({ (data: NSMutableArray) -> Void in
            println(data)
            self.objects = data
            println(self)
//            println("re render the table")
//            println(self.objects)
        })
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "switchToNewChat:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func switchToNewChat(sender: AnyObject) {
        self.performSegueWithIdentifier("showNewChat", sender: sender)
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as AnyObject
                (segue.destinationViewController as ChatViewController).detailItem = object
            }
        }
        
        if segue.identifier == "showNewChat" {
            (segue.destinationViewController as NewChatViewController).chatCollection = self.chatModel
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let chat = objects[indexPath.row]
        cell.textLabel.text = chat["name"] as NSString
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //            objects.removeObjectAtIndex(indexPath.row)
            //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
}

