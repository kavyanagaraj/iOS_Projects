//
//  BeastCustomTableViewCell.swift
//  ToBeast
//
//  Created by asingiri on 5/26/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class BeastCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var beastText: UILabel!
    var delegate : BeastedDelegate?
    @IBOutlet weak var beastButton: UIButton!
    
    @IBAction func beastButtonPress(_ sender: UIButton) {
        delegate?.beastButtonPressed(indexPathrow: sender.tag)
    }
}
