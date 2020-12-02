//
//  MoodEntry+CoreDataClass.swift
//  Fitspace
//
//  Created by Kha-Yu Cheam on 11/21/20.
//
//

import Foundation
import CoreData

enum Mood: String, CaseIterable {
    case happy
    case semiHappy
    case meh
    case sad
    case terrible
}

@objc(MoodEntry)
public class MoodEntry: NSManagedObject {
    lazy var moodType: Mood = {
        Mood(rawValue: mood)!
    }()
}
