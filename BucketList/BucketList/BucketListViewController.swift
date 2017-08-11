//
//  ViewController.swift
//  BucketList
//
//  Created by asingiri on 5/15/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    //Initialising bucketlist to be list of BucketListItem items
    var bucketList = [BucketListItem]()
    
    //MOC which is like a middleman between database and client
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Grab data from the DB/MOC and populate that as bucketlist array on view load(Pass by reference)
        fetchItems()
    }
    
    //Number of rows the table should have since it is dynamic
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucketList.count
    }

    //Each cell and its content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bucketList", for: indexPath)
        cell.textLabel?.text = bucketList[indexPath.row].text!
        return cell
    }
    
    //Action when accessory button is tapped(For edit)
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //perform segue with the segue identifier EditItemSegue and pass index path as you will need to know which cell user is trying to edit
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    
    //Not sure what commit editing style does... But it gives the row you are trying to delete?
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //Delete the selected item from MOC and using savedata update the DB
        managedObjectContext.delete(bucketList[indexPath.row])
        
        //To show the changes locally make changes to the bucketlist array reload table data instead of doing a fetch request again
        bucketList.remove(at: indexPath.row)
        saveData()
        tableView.reloadData()
    }
    
    //Prepare for transition/segue with all the necessary data and delegates needed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue"{
            
            // From the current view controller traverse to the navigationController
            let navigationController = segue.destination as! UINavigationController
            
            //From navigationController's array get to the first/top view controller
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            
            //Make the delegate in the transitioned view controller to be this controller
            addItemTableViewController.delegate = self
        }
        else if segue.identifier == "EditItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            
            //Passing the indexpath and item text since it is edit segue
            let indexPath = sender as! NSIndexPath
            let item = bucketList[indexPath.row]
            addItemTableViewController.item = item.text!
            addItemTableViewController.indexPath = indexPath
        }
        
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        //Dismiss the view
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, atIndex indexPath : NSIndexPath?) {
        dismiss(animated: true, completion: nil)
        
        //Since it is passed by reference change the editted content to be the new content passed in through delegate
        if let ip = indexPath{
            bucketList[ip.row].text = text
        }
        else{
            //Insert new object into the table with text passed through the delegate
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
//            let item = BucketListItem(context: managedObjectContext)
            item.text = text
            
            //Since we are grabbing data only on load to see the new content make this local change to the bucketlist array
            bucketList.append(item)
        }
        saveData()
        tableView.reloadData()
    }
    
    
    func fetchItems(){
        //Request for entity BucketListItem
        let request = NSFetchRequest<NSFetchRequestResult>(entityName : "BucketListItem")
        
        do{
            let result = try managedObjectContext.fetch(request)
            bucketList = result as! [BucketListItem]
            print(bucketList.count)
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

