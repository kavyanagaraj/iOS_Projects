//
//  BeastedViewController.swift
//  ToBeast
//
//  Created by asingiri on 5/26/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit
import CoreData

class BeastedViewController: UITableViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var beastList = [Beast]()
    var beasted = [Beast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       fetchData()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beastList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beastedCell", for: indexPath)
        print("ind",indexPath.row)
        cell.textLabel?.text = beastList[indexPath.row].title
        if beastList[indexPath.row].is_beasted == true{
            cell.textLabel?.text = beastList[indexPath.row].title
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            cell.detailTextLabel?.text = formatter.string(from: beastList[indexPath.row].created_at! as Date)
        }
        return cell
    }
    
    
    
    func fetchData(){
        //Request for entity TodoListItem
        let request = NSFetchRequest<NSFetchRequestResult>(entityName : "Beast")
        
        do{
            request.predicate = NSPredicate(format: "is_beasted = %@", true as CVarArg)
            let result = try managedObjectContext.fetch(request)
            beastList = result as! [Beast]
        }
        catch {
            print("\(error)")
        }
    }
    
    func saveData(){
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success")
            } catch {
                print("\(error)")
            }
        }
    }

}
