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

    @NSManaged public var journalEntries: NSSet?
    @NSManaged public var moodEntries: MoodEntry?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for journalEntries
extension Journal {

    @objc(addJournalEntriesObject:)
    @NSManaged public func addToJournalEntries(_ value: JournalEntry)

    @objc(removeJournalEntriesObject:)
    @NSManaged public func removeFromJournalEntries(_ value: JournalEntry)

    @objc(addJournalEntries:)
    @NSManaged public func addToJournalEntries(_ values: NSSet)

    @objc(removeJournalEntries:)
    @NSManaged public func removeFromJournalEntries(_ values: NSSet)

}

extension Journal : Identifiable {

}
