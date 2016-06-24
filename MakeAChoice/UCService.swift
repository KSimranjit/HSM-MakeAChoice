//
//  UCService.swift
//  MakeAChoice
//
//  Created by Simranjit Kaur on 24/06/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UCService{
    

static func createRC() {
    
    /* getting in json from webapi
     {
     "Title" : "to do List",
     "noOfTimes" : "1",
     "CTAAction" : "Doing",
     }
     */
    
    
    
    if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    {
        
        if let uChoice = NSEntityDescription.insertNewObjectForEntityForName("UserChoices", inManagedObjectContext: managedObjectContext) as? UserChoices{
            
            uChoice.title = "to do List"
            uChoice.ctaAction = "doing"
            uChoice.noOfTimes = 1
            
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
        
        
        
    }
    
}
}

