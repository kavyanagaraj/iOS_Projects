//
//  ViewController.swift
//  ColdCall
//
//  Created by asingiri on 5/10/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let nameArr = ["Ready?", "Antony", "Brian", "Jim", "Bill", "Courtney"]
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func coldCall(_ sender: Any) {
        let ranNum = Int(arc4random_uniform(UInt32(nameArr.count - 1)) + 1)
        print(ranNum)
        nameLabel.text = nameArr[ranNum]
        numberLabel.text = String(ranNum)
        if ranNum == 1 || ranNum == 2{
            numberLabel.textColor = UIColor.red
        }else if ranNum == 3 || ranNum == 4{
           numberLabel.textColor = UIColor.orange
        }
        else{
            numberLabel.textColor = UIColor.green
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameLabel.text = nameArr[0]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

