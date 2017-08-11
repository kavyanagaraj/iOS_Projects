//
//  AddItemViewController.swift
//  ToBeast
//
//  Created by asingiri on 5/26/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var delegate : AddItemDelegate?
    var beastText : String?
    var indexPath : NSIndexPath?
    
    @IBOutlet weak var titleText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = beastText{
            titleText.text = text
        }
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        delegate?.cancelButtonPressed(controller: self)
    }
   
    @IBAction func doneButtonPressed(_ sender: Any) {
        let text = titleText.text
        
        if let ind = indexPath{
           delegate?.doneEditButtonPressed(controller: self, text: text!, indexPath: ind)
        }
        else{
           delegate?.doneButtonPressed(controller: self, text: text!)
        }
    }
    
}
