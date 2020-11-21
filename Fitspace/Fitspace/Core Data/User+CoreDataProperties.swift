//
//  User+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var dob: Date
    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var profileImage: String?
    @NSManaged public var goals: Set<Goal>?
    @NSManaged public var healthStats: HealthStats
    @NSManaged public var journal: Journal?

}

// MARK: Generated accessors for goals
extension User {

    @objc(addGoalsObject:)
    @NSManaged public func addToGoals(_ value: Goal)

    @objc(removeGoalsObject:)
    @NSManaged public func removeFromGoals(_ value: Goal)

    @objc(addGoals:)
    @NSManaged public func addToGoals(_ values: NSSet)

    @objc(removeGoals:)
    @NSManaged public func removeFromGoals(_ values: NSSet)

}

extension User : Identifiable {

}
