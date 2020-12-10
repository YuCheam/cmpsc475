//
//  ProgressPic+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension ProgressPic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProgressPic> {
        return NSFetchRequest<ProgressPic>(entityName: "ProgressPic")
    }

    @NSManaged public var category: String
    @NSManaged public var date: Date
    @NSManaged public var imageData: Data?
    @NSManaged public var userHealthStats: HealthStats

}

extension ProgressPic : Identifiable {

}
