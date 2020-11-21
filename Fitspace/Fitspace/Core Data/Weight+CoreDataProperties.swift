//
//  Weight+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension Weight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weight> {
        return NSFetchRequest<Weight>(entityName: "Weight")
    }

    @NSManaged public var amount: Double
    @NSManaged public var date: Date
    @NSManaged public var userHealthStats: HealthStats

}

extension Weight : Identifiable {

}
