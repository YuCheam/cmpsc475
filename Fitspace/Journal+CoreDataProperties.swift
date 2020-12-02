//
//  Journal+CoreDataProperties.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 12/1/20.
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
    @NSManaged public func addToJournalEntries(_ values: NSSet)

    @objc(removeJournalEntries:)
    @NSManaged public func removeFromJournalEntries(_ values: NSSet)

}

// MARK: Generated accessors for moodEntries
extension Journal {

    @objc(addMoodEntriesObject:)
    @NSManaged public func addToMoodEntries(_ value: MoodEntry)

    @objc(removeMoodEntriesObject:)
    @NSManaged public func removeFromMoodEntries(_ value: MoodEntry)

    @objc(addMoodEntries:)
    @NSManaged public func addToMoodEntries(_ values: NSSet)

    @objc(removeMoodEntries:)
    @NSManaged public func removeFromMoodEntries(_ values: NSSet)

}

extension Journal : Identifiable {

}
