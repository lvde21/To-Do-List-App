//
//  FirstViewController.swift
//  To Do List
//
//  Created by Lala Vaishno De on 5/16/15.
//  Copyright (c) 2015 Lala Vaishno De. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if the string array already exists
        if(NSUserDefaults.standardUserDefaults().objectForKey("items") != nil) {
        
                //restores items from NSUserDefaults when the app is reopened
                items = NSUserDefaults.standardUserDefaults().objectForKey("items") as [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData();
    }
    
    //create table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell1")
        
        cell.textLabel?.text = "\(items[indexPath.row])"
        
        return cell;
    }
    
    //this method is called when user tries to edit something in the table
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //to check for a swipe to the left.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            items.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(items, forKey: "items")
        }
        toDoListTable.reloadData();
    }
    
    

}

