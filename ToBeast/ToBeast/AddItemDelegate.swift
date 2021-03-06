//
//  AddItemDelegate.swift
//  ToBeast
//
//  Created by asingiri on 5/26/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemDelegate: class {
    func cancelButtonPressed(controller: UIViewController)
    func doneButtonPressed(controller: UIViewController, text: String)
    func doneEditButtonPressed(controller: UIViewController, text: String, indexPath: NSIndexPath)
}
