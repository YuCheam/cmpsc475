//
//  PP_Image+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/10/20.
//
//

import Foundation
import CoreData


extension PP_Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PP_Image> {
        return NSFetchRequest<PP_Image>(entityName: "PP_Image")
    }

    @NSManaged public var data: Data?
    @NSManaged public var isSelected: Bool
    @NSManaged public var date: ProgressPic?

}
