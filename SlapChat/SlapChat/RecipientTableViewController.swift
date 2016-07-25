//
//  RecipientTableViewController.swift
//  SlapChat
//
//  Created by Laticia Chance on 7/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RecipientTableViewController: UITableViewController {
    
    var managedRecipientsObjects: [Recipient] = []
    let store: DataStore = DataStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchDataRecipient()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        
        //store.fetchDataMessages()
        store.fetchDataRecipient()
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.recipients.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        let eachRecipient = store.recipients[indexPath.row]
        
        cell.textLabel?.text = eachRecipient.name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let messageVC = segue.destinationViewController as! TableViewController
        let indexPath = tableView.indexPathForSelectedRow
        if let indexPath = indexPath {
            let recipient = store.recipients[indexPath.row]
            messageVC.recipient = recipient

        }
        
        
        
        
    }
}


