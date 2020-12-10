//
//  Image+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/10/20.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var data: Data
    @NSManaged public var isSelected: Bool
    @NSManaged public var date: ProgressPic

}
