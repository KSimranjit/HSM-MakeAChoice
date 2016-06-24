//
//  TableViewController.swift
//  MakeAChoice
//
//  Created by Simranjit Kaur on 24/06/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController ,NSFetchedResultsControllerDelegate{

    var tableArray = ["title 1","title 2","title3"]
    
    var rChoices: [RecommendedChoices] = []
    var fetchedResultsController: NSFetchedResultsController!
    var rChoice: RecommendedChoices!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Recommended Choices"
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Core Data
        // This method called after webAPI call to Recommended choices
        RCService.createRC()
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            
            fetchedResultsController = NSFetchedResultsController(fetchRequest: RecommendedChoices.fetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "title", cacheName: nil)
            fetchedResultsController.delegate = self
            
            do {
                try fetchedResultsController.performFetch()
                rChoices = fetchedResultsController.fetchedObjects as! [RecommendedChoices]
                
            } catch {
                print(error)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = fetchedResultsController.sections! as [NSFetchedResultsSectionInfo]
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)

        
        let choices = fetchedResultsController.objectAtIndexPath(indexPath) as! RecommendedChoices
        

       cell.textLabel?.text = choices.title
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
  
 
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        //NSManagedObject for the selected row saved in rChoice
        self.rChoice = self.fetchedResultsController.objectAtIndexPath(indexPath) as! RecommendedChoices
        
        let chooseToDo = UITableViewRowAction(style: .Normal, title: "Choose To Do") { (action, indexPath) in
            //WEB API CALL for the action'choosetodo'
            //After Successful response from WEB API
            //Add to UserChoice in CoreDBModel and delete from RecommendedChoice
            
            
            UCService.createRC()
            print("added to userchoice")
            // CALL to method in RCService to delete this object from Core Data
            self.fetchedResultsController.managedObjectContext.deleteObject(self.rChoice)
            print("delete from recommendedChoiceView")
            
        }
        
        let notForMe = UITableViewRowAction(style:.Default, title: "Not Now") { (action, indexPath) in
            
            // CALL to method in RCService to delete this object from Core Data
            
            print("delete from recommendedChoiceView")
            self.fetchedResultsController.managedObjectContext.deleteObject(self.rChoice)
        }
     
        return [chooseToDo,notForMe]
    }
    
    
    // Override to support editing the table view.
   /* override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
*/
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Fetched Results Controller
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        default:
            tableView.reloadData()
        }
        
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Fade)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
            
        default:
            tableView.reloadData()
        }
        
        // Sync our array with the fetchedResultsController
        rChoices = controller.fetchedObjects as! [RecommendedChoices]
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
