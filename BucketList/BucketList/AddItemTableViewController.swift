//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by asingiri on 5/16/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    //Delegate which will be set from the view it is coming from
    weak var delegate : AddItemTableViewControllerDelegate?
    var item : String?
    var indexPath : NSIndexPath?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    //Invoking the delegates cancel button pressed on action of the cancel button
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    //Invoking the delegates itemsaved on action of the save button pressed
    @IBAction func saveButtonPressed(_ sender: Any) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, atIndex : indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
    }

}
