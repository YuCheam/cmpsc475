//
//  Journal+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var journalEntries: Set<JournalEntry>?
    @NSManaged public var moodEntries: Set<MoodEntry>?
    @NSManaged public var user: User

}

// MARK: Generated accessors for journalEntries
extension Journal {

    @objc(addJournalEntriesObject:)
    @NSManaged public func addToJournalEntries(_ value: JournalEntry)

    @objc(removeJournalEntriesObject:)
    @NSManaged public func removeFromJournalEntries(_ value: JournalEntry)

    @objc(addJournalEntries:)
    @NSManaged public func addToJournalEntries(_ values: MoodEntry)

    @objc(removeJournalEntries:)
    @NSManaged public func removeFromJournalEntries(_ values: MoodEntry)

}


extension Journal : Identifiable {

}
