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
    @NSManaged public var imageData: Data?
    @NSManaged public var isSelected: Bool
    @NSManaged public var userHealthStats: HealthStats

}
