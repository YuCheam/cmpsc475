//
//  BookMO+CoreDataProperties.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/28/20.
//
//

import Foundation
import CoreData


extension BookMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookMO> {
        return NSFetchRequest<BookMO>(entityName: "BookMO")
    }

    @NSManaged public var author: String?
    @NSManaged public var country: String
    @NSManaged public var image: String
    @NSManaged public var isCompleted: Bool
    @NSManaged public var isReading: Bool
    @NSManaged public var language: String
    @NSManaged public var link: String
    @NSManaged public var pages: Float
    @NSManaged public var pagesRead: Float
    @NSManaged public var title: String
    @NSManaged public var year: Int32
    @NSManaged public var notes: NoteMO

}

extension BookMO : Identifiable {

}
