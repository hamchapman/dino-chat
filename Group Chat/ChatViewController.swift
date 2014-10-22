//
//  ChatViewController.swift
//  GroupChat
//
//  Created by Hamilton Chapman on 20/10/2014.
//  Copyright (c) 2014 Pusher. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    var chatMessages = NSMutableArray()
    var messageModel = MessageModel()
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newMessageName: UITextField!
    @IBAction func addMessageButton(sender: AnyObject) {
        messageModel.addMessage(self.newMessageName.text)
        self.newMessageName.text = ""
        tableView.reloadData()
    }
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail["name"] as NSString
            }
        }
    }
    
    func switchToChatList(sender: AnyObject) {
        self.performSegueWithIdentifier("showChatList", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "switchToChatList:")
        self.chatMessages = messageModel.getMessages()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        newMessageName.delegate = self;
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addMessageButton(textField)
        return true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let message = chatMessages[indexPath.row]
        cell.textLabel.text = message["name"] as NSString
        return cell
    }
}