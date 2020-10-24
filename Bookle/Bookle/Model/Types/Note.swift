//
//  Note.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/23/20.
//

import Foundation

struct Note: Codable, Identifiable, Hashable {
    let id: Date
    let timeOfCreation: Date
    let pageProgress: Float
    var noteText: String
    var isExpanded: Bool = false
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: timeOfCreation)
    }
    
    
    init(page: Float, text: String) {
        let _date = Date()
        timeOfCreation = _date
        pageProgress = page
        noteText = text
        id = _date
    }
}
