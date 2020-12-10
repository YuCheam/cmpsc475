//
//  ProgressPic+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/10/20.
//
//

import Foundation
import CoreData


extension ProgressPic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProgressPic> {
        return NSFetchRequest<ProgressPic>(entityName: "ProgressPic")
    }

    @NSManaged public var date: Date
    @NSManaged public var userHealthStats: HealthStats
    @NSManaged public var images: Set<PP_Image>

}

// MARK: Generated accessors for images
extension ProgressPic {

    @objc(addImagesObject:)
    @NSManaged public func addToImages(_ value: PP_Image)

    @objc(removeImagesObject:)
    @NSManaged public func removeFromImages(_ value: PP_Image)

    @objc(addImages:)
    @NSManaged public func addToImages(_ values: NSSet)

    @objc(removeImages:)
    @NSManaged public func removeFromImages(_ values: NSSet)

}
