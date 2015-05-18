//
//  SecondViewController.swift
//  To Do List
//
//  Created by Lala Vaishno De on 5/16/15.
//  Copyright (c) 2015 Lala Vaishno De. All rights reserved.
//

import UIKit

var items = [String]()
//make a global array and initializing it

class SecondViewController: UIViewController {

    
    @IBOutlet weak var item: UITextField!
    
    @IBAction func add(sender: AnyObject) {
        items.append(item.text);
        item.text = ""
        NSUserDefaults.standardUserDefaults().setObject(items, forKey: "items")
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //add functions for the keyboard to close
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true);
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder();
        return true;
    }

}

