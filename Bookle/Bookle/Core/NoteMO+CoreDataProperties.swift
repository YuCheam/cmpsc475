//
//  NoteMO+CoreDataProperties.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/28/20.
//
//

import Foundation
import CoreData


extension NoteMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteMO> {
        return NSFetchRequest<NoteMO>(entityName: "NoteMO")
    }

    @NSManaged public var noteText: String?
    @NSManaged public var pageProgress: Float
    @NSManaged public var timeOfCreation: Date?
    @NSManaged public var book: BookMO?

}

extension NoteMO : Identifiable {

}
