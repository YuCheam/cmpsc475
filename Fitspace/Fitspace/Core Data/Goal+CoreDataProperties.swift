//
//  Goal+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var details: String
    @NSManaged public var endDate: Date?
    @NSManaged public var startDate: Date?
    @NSManaged public var title: String
    @NSManaged public var user: User

}

extension Goal : Identifiable {

}
