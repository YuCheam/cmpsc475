//
//  HealthStats+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension HealthStats {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HealthStats> {
        return NSFetchRequest<HealthStats>(entityName: "HealthStats")
    }

    @NSManaged public var height: Int
    @NSManaged public var bodyMeasurements: Set<BodyMeasurements>?
    @NSManaged public var images: NSSet?
    @NSManaged public var weightHistory: Set<Weight>
    @NSManaged public var user: User

}

// MARK: Generated accessors for bodyMeasurements
extension HealthStats {

    @objc(addBodyMeasurementsObject:)
    @NSManaged public func addToBodyMeasurements(_ value: BodyMeasurements)

    @objc(removeBodyMeasurementsObject:)
    @NSManaged public func removeFromBodyMeasurements(_ value: BodyMeasurements)

    @objc(addBodyMeasurements:)
    @NSManaged public func addToBodyMeasurements(_ values: NSSet)

    @objc(removeBodyMeasurements:)
    @NSManaged public func removeFromBodyMeasurements(_ values: NSSet)

}

// MARK: Generated accessors for images
extension HealthStats {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: ProgressPic)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: ProgressPic)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}

// MARK: Generated accessors for weightHistory
extension HealthStats {

    @objc(addWeightHistoryObject:)
    @NSManaged public func addToWeightHistory(_ value: Weight)

    @objc(removeWeightHistoryObject:)
    @NSManaged public func removeFromWeightHistory(_ value: Weight)

    @objc(addWeightHistory:)
    @NSManaged public func addToWeightHistory(_ values: NSSet)

    @objc(removeWeightHistory:)
    @NSManaged public func removeFromWeightHistory(_ values: NSSet)

}

extension HealthStats : Identifiable {
    var heightFormatted: String {
        let inches = height % 12
        let feet = (height-inches)/12
        return "\(feet)'\(inches)''"
    }
}
