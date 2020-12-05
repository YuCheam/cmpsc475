//
//  Weight+CoreDataClass.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData

@objc(Weight)
public class Weight: NSManagedObject {
    lazy var stringDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: date)
    }()
}
