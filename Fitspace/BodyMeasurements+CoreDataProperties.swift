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
    @NSManaged public var hips: Float
    @NSManaged public var waist: Float
    @NSManaged public var thigh: Float
    @NSManaged public var arm: Float
    @NSManaged public var neck: Float
    @NSManaged public var userHealthStats: HealthStats

}
