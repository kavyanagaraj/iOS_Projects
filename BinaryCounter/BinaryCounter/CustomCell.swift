//
//  File.swift
//  BinaryCounter
//
//  Created by asingiri on 5/22/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var delegate : PowersDelegate?
    
    @IBOutlet weak var cellTextLabel: UILabel!
    @IBAction func MinusPressed(_ sender: Any) {
        delegate?.deductValuePressed(value: Int(cellTextLabel.text!)!)
    }
    @IBAction func AddPressed(_ sender: Any) {
       delegate?.addValuePressed(value: Int(cellTextLabel.text!)!)
    }
}
