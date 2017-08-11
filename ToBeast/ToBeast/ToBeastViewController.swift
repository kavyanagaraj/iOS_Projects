//
//  ViewController.swift
//  ToBeast
//
//  Created by asingiri on 5/26/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit
import CoreData

class ToBeastViewController: UITableViewController, AddItemDelegate, BeastedDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var beastList = [Beast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beastList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeastCustomCell", for: indexPath) as! BeastCustomTableViewCell
        cell.beastText.text = beastList[indexPath.row].title
        cell.beastButton.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        managedObjectContext.delete(beastList[indexPath.row])
        beastList.remove(at: indexPath.row)
        saveData()
        tableView.reloadData()
    }
    
    
    func beastButtonPressed(indexPathrow: Int) {
        beastList[indexPathrow].is_beasted = true
        beastList.remove(at: indexPathrow)
        saveData()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    
    @IBAction func AddItemButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddItemSegue", sender: sender)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let controller = navigationController.topViewController as! AddItemViewController
        
        if segue.identifier == "EditItemSegue"{
            controller.delegate = self
            let ind = sender as! NSIndexPath
            let text = beastList[ind.row].title
            controller.indexPath = ind
            controller.beastText = text
        }
        else if segue.identifier == "AddItemSegue"{
            controller.delegate = self
        }
        
    }
    
    func cancelButtonPressed(controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func doneButtonPressed(controller: UIViewController, text: String) {
        dismiss(animated: true, completion: nil)
        let item = NSEntityDescription.insertNewObject(forEntityName: "Beast", into: managedObjectContext) as! Beast
        item.title = text
        item.created_at = Date() as NSDate
        item.is_beasted = false
        beastList.append(item)
        saveData()
        tableView.reloadData()
    }
    
    func doneEditButtonPressed(controller: UIViewController, text: String, indexPath: NSIndexPath) {
        dismiss(animated: true, completion: nil)
        beastList[indexPath.row].title = text
        saveData()
        tableView.reloadData()
    }
    
    func fetchData(){
        //Request for entity TodoListItem
        let request = NSFetchRequest<NSFetchRequestResult>(entityName : "Beast")
        
        do{
            request.predicate = NSPredicate(format: "is_beasted = %@", false as CVarArg)
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

