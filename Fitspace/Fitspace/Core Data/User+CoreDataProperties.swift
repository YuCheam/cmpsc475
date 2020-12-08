//
//  User+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData
import UIKit


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var profileImage: Data?
    @NSManaged public var dob: Date
    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var goals: Set<Goal>?
    @NSManaged public var healthStats: HealthStats
    @NSManaged public var journal: Journal

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
    var age: Int {
        let calendar = Calendar.current
        let calcAge = calendar.dateComponents([.year], from: dob, to: Date())
        return calcAge.year!
    }
    
    var weight: Float {
        let weights = Array(self.healthStats.weightHistory)
        return weights.sorted(by: {$0.date > $1.date}).first?.amount ?? 0
    }
    
    var image: UIImage {
        if let data = profileImage {
            return UIImage(data: data) ?? UIImage()
        } else {
            return UIImage()
        }
    }
}
