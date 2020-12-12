//
//  User+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/11/20.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var dob: Date?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var profileImage: Data?
    @NSManaged public var goalWeight: Float
    @NSManaged public var goals: NSSet?
    @NSManaged public var healthStats: HealthStats?
    @NSManaged public var journal: Journal?
    @NSManaged public var widgets: NSSet?

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

// MARK: Generated accessors for widgets
extension User {

    @objc(addWidgetsObject:)
    @NSManaged public func addToWidgets(_ value: Widget)

    @objc(removeWidgetsObject:)
    @NSManaged public func removeFromWidgets(_ value: Widget)

    @objc(addWidgets:)
    @NSManaged public func addToWidgets(_ values: NSSet)

    @objc(removeWidgets:)
    @NSManaged public func removeFromWidgets(_ values: NSSet)

}

extension User : Identifiable {

}
