//
//  RCService.swift
//  MakeAChoice
//
//  Created by Simranjit Kaur on 24/06/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//
import UIKit
import Foundation
import CoreData

class RCService{
    
    
    static func createRC() {
        
        /* if getting in json from webapi
         {
         "Title" : "to do List",
         "Time" : "20 minutes",
         "Blurb" : "This activity helps you to jot down the basic tasks to be done ",
         "Instruction" : "This activity helps you to jot down the basic tasks to be done. Yo can write down daily  chores , your hobbies or some appointments"
         }
         */
        
    

        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        {
            
            if let rChoice = NSEntityDescription.insertNewObjectForEntityForName("RecommendedChoices", inManagedObjectContext: managedObjectContext) as? RecommendedChoices{
            
            // static data
            rChoice.title = "List"
            rChoice.blurb = "This activity helps you to jot down the basic tasks to be done"
            rChoice.instructions = "This activity helps you to jot down the basic tasks to be done. Yo can write down daily  chores , your hobbies or some appointments"
            let timeString = "00:20:00"
            let time = timeString.toDate("h:mm:aa")
            print(time)
            rChoice.time = time
                
            }
            
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error)
                }
                
        
            
        }
    
    }
}




