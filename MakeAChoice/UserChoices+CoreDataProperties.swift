//
//  UserChoices+CoreDataProperties.swift
//  MakeAChoice
//
//  Created by Simranjit Kaur on 24/06/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension UserChoices {

    @NSManaged var title: String?
    @NSManaged var ctaAction: String?
    @NSManaged var noOfTimes: NSNumber?

}
