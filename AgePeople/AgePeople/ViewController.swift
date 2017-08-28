//
//  ViewController.swift
//  AgePeople
//
//  Created by asingiri on 5/15/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var names = ["Bob", "Bill", "James", "Kim"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
//        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "PeopleAgeCell", for: indexPath)
        cell.textLabel?.text = self.names[indexPath.row]
        cell.detailTextLabel?.text = "\(arc4random_uniform(90) + 5) years old"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//extension ViewController: UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "PeopleAgeCell", for: indexPath)
//        cell.NameLabel.text = self.names[indexPath.row]
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//}
