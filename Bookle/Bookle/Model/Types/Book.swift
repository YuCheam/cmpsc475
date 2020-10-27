//
//  Book.swift
//  Bookle
//
//  Created by Kha-Yu Cheam on 10/23/20.
//

import Foundation

struct Book : Identifiable, Hashable {
    let author: String?
    let country: String
    let image: String
    let language: String
    let link: String
    var pages: Float
    let title: String
    let year: Int32
    
    var id: String {title}
    
    var isReading: Bool
    var isCompleted: Bool
    var pagesRead: Float
    var notes: [Note]
    
    enum CodingKeys: String, CodingKey {
        case author
        case country
        case image
        case language
        case link
        case pages
        case title
        case year
        case isReading
        case isCompleted
        case pagesRead
        case notes
    }
    
    mutating func addNote(note: Note) {
        notes.append(note)
    }
    
    mutating func deleteNote(index: Int) {
        notes.remove(at: index)
    }
    
    func getNoteIndex(note: Note) -> Int {
        notes.firstIndex(of: note)!
    }
}

extension Book: Codable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        country = try values.decode(String.self, forKey: .country)
        image = try values.decode(String.self, forKey: .image)
        language = try values.decode(String.self, forKey: .language)
        link = try values.decode(String.self, forKey: .link)
        pages = try values.decode(Float.self, forKey: .pages)
        title = try values.decode(String.self, forKey: .title)
        year = try values.decode(Int32.self, forKey: .year)
        isReading = try values.decodeIfPresent(Bool.self, forKey: .isReading) ?? false
        isCompleted = try values.decodeIfPresent(Bool.self, forKey: .isCompleted) ?? false
        pagesRead = try values.decodeIfPresent(Float.self, forKey: .pagesRead) ?? 0
        notes = try values.decodeIfPresent(Array.self, forKey: .notes) ?? []
    }
}
