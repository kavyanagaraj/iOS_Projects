//
//  ViewController.swift
//  BinaryCounter
//
//  Created by asingiri on 5/22/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class BinaryCounterViewController: UIViewController, UITableViewDataSource, PowersDelegate {

    @IBOutlet weak var totalLabel: UILabel!
    var sum = 0
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        totalLabel.text = String(sum)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.cellTextLabel.text = "\(pow(10, indexPath.row))"
        cell.backgroundColor = UIColor(red: 47/255, green: 72/255, blue: 96/255, alpha: 1)
        cell.delegate = self
        return cell
    }
    
   
    
    func addValuePressed(value: Int) {
        sum += value
        totalLabel.text = String(sum)
    }
    
    func deductValuePressed(value: Int) {
        sum -= value
        totalLabel.text = String(sum)
    }
}

