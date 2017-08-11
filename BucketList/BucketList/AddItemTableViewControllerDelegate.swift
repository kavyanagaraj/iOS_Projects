//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by asingiri on 5/16/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit


//Like an interface.. Any class which extends this protocol must implement the functions declared
protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text : String, atIndex indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
