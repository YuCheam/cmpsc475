//
//  BodyMeasurements+CoreDataProperties.swift
//  Charts
//
//  Created by Kha-Yu Cheam on 12/2/20.
//
//

import Foundation
import CoreData


extension BodyMeasurements {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BodyMeasurements> {
        return NSFetchRequest<BodyMeasurements>(entityName: "BodyMeasurements")
    }

    @NSManaged public var date: Date
    @NSManaged public var hips: Double
    @NSManaged public var waist: Double
    @NSManaged public var thigh: Double
    @NSManaged public var arm: Double
    @NSManaged public var neck: Double
    @NSManaged public var userHealthStats: HealthStats

}
