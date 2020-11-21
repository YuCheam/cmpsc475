//
//  MoodEntry+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension MoodEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoodEntry> {
        return NSFetchRequest<MoodEntry>(entityName: "MoodEntry")
    }

    @NSManaged public var date: Date?
    @NSManaged public var details: String?
    @NSManaged public var mood: String?
    @NSManaged public var journal: Journal?

}

extension MoodEntry : Identifiable {

}
