//
//  Helper.swift
//  MakeAChoice
//
//  Created by Simranjit Kaur on 24/06/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import Foundation

extension NSDate {
    
    func toString() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.stringFromDate(self)
        
}

}

extension String {

    func toDate(dateFormat: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.dateFromString(self)
    }
    
}

