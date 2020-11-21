//
//  BodyMeasurements+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension BodyMeasurements {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BodyMeasurements> {
        return NSFetchRequest<BodyMeasurements>(entityName: "BodyMeasurements")
    }

    @NSManaged public var bust: Int32
    @NSManaged public var date: Date?
    @NSManaged public var hip: Int32
    @NSManaged public var waist: Int32
    @NSManaged public var userHealthStats: HealthStats?

}

extension BodyMeasurements : Identifiable {

}
