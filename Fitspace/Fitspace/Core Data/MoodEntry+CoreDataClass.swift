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
    var moodType: Mood {
        Mood(rawValue: mood)!
    }
    
    var moodEmoji: String {
        switch moodType {
        case .happy:
            return "😄"
        case .semiHappy:
            return "🙂"
        case .sad:
            return "🙁"
        case .terrible:
            return "😣"
        default: // .meh
            return "😐"
        }
    }
    
    lazy var stringDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "MM/dd"
        
        return dateFormatter.string(from: date)
    }()
}
