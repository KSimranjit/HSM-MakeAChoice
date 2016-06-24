//
//  UserChoices.swift
//  MakeAChoice
//
//  Created by Simranjit Kaur on 24/06/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import Foundation
import CoreData


class UserChoices: NSManagedObject {

    static func fetchRequest() -> NSFetchRequest {
        // Fetching data  from UserChoices entity and sorting it according to title attribute
        let fetchRequest = NSFetchRequest(entityName: "UserChoices")
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }

}
